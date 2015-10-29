#include <malloc.h>
#include <stdio.h>
#include <string.h>
using namespace std;

enum Type { VECTOR=0, BOXED=1 }; // late addition; originally just 0,1 in source

struct a {
  Type type; // originally int, of course
  int rank;
  int dim[3]; 
  int p[2]; // really a buffer, used as a variable-size array.
};
typedef a* A;

// V1(f) is "define one-argument function f"
// V2(f) is "define two-argument function f"
// In both cases, functions take and return "struct a" pointers.
// Arguments have predefined names: w is the second or only (right) arg,
// a is the first (left) one when there's two.
#define V1(f)	A f(A w)
#define V2(f)	A f(A a, A w)

// Originally this was defined as DO(n,x)
// with "capture" of i into expression x
// More modern definition relies on new scoping rules
// for the 'for' statement and allows more natural (IMO)
// use pattern, "DO(n){x}"; note i is still available for user.
#define DO(n) for(int i=0,_n=(n); i<_n;++i)

// typedef long I; // but I used as int throughout program
// #define R return
// I *ma(n){R(I*)malloc(n*4);}
int *alloc(int n)
{ 
  return (int*) malloc(n*sizeof(int)); // originally n*4
}

// mv(d,s,n)I *d,*s;{DO(n,d[i]=s[i]);}
void move(int* dest, int* src, int n)
{
  DO(n) { dest[i]=src[i]; } // remember, i comes from DO
}

// tr(r,d)I *d;{I z=1;DO(r,z=z*d[i]);R z;}
int tr(int rank, int* dim)
{
  int z = 1;
  DO(rank) { z *= dim[i]; }
  return z;
}

A ga(Type type, int rank, int *dim) // generate a; originally type was int
{
  A z = (A)alloc(5 + tr(rank,dim)); //5 is the "constant size", the rest is p
  z->type = type;
  z->rank = rank;
  move(z->dim, dim, rank);
  return z;
}

V1(iota) // A iota (A w)
{
  int n = w->p[0];
  A z = ga(VECTOR,1,&n); // generate rank-1 array of size n
  DO (n) { z->p[i]=i; }
  return z;
}

V2(plus) // A plus (A a, A w)
{
  int rank = w->rank;
  int *dim = w->dim;
  int n = tr(rank, dim);
  A z = ga(VECTOR,rank,dim);
  DO(n) { z->p[i]=a->p[i]+w->p[i]; } // assume a at least as big as w
  return z;
}

V2(from)
{
  int rank = w->rank-1;
  int *dim = w->dim + 1; // drop the first dimension
  int n = tr(rank,dim);
  A z = ga(w->type, rank, dim);
  move(z->p, w->p + (n**a->p), n);
  return z;
}

V1(box)
{
  A z=ga(BOXED,0,0);
  *(z->p) = (int)w; // valid because tr(0,0)=1, assuming sizeof(ptr)==sizeof(int)
  return z;
}

V2(cat)
{
  int an=tr(a->rank,a->dim);
  int wn=tr(w->rank,w->dim);
  int n=an+wn;
  A z=ga(w->type,1,&n); // result is flattened
  move(z->p,a->p,an);
  move(z->p+an,w->p,wn);
  return z;
}

V2(find){} // not implemented in that afternoon...


V2(reshape) // originally rsh
{
  // Assume a is of rank<2. Even if not, only take the first.
  int rank = a->rank ? a->dim[0] : 1;
  int n=tr(rank,a->p);
  int wn=tr(w->rank, w->dim);
  A z=ga(w->type, rank, a->p);
  wn = n>wn ? wn : n; // min(wn,n)
  move (z->p, w->p, wn);
  if(n-=wn)
    move (z->p+wn,z->p,n); // cycle if shape larger than content
  return z;
}

V1(shape) // originally sha
{
  A z=ga(VECTOR, 1, &w->rank);
  move (z->p, w->dim, w->rank);
  return z;
}

V1(id) { return w; } // this and the next were on the same line...

V1(size)
{
  A z=ga(VECTOR,0,0);
  z->p[0] = w->rank ? w->dim[0]: 1;
  return z;
}

// #define printf P
void print1(int i) { printf("%d ", i); } // pi(i){P("%d ",i);}
void newline()      { printf("\n"); } // nl(){P("\n");}

void print(A w) 
{
  int rank = w->rank;
  int* dim = w->dim;
  int n = tr(rank, dim);
  DO(rank) { print1(dim[i]); }
  newline();
  if (w->type!=VECTOR) {
    DO(n) { 
      printf("< ");
      print((A)(w->p[i]));
    }
  }
  else {
    DO(n) { print1(w->p[i]); }
  }
  newline();
}

///////////////////////////////////////////////////////////
// Whitney had an empty line here; supposedly this ends
// the "functions" part and starts the "interpreter" part,
// though I personally would add the printing functions
// to the interpreter.
///////////////////////////////////////////////////////////

char verb_names[] = "+{~<#,"; // originally vt
// A(*vd[])()={0,plus,from,find,0,rsh,cat},
//  (*vm[])()={0,id,size,iota,box,sha,0};
// in K&R C, the type of f in "A (*f)()" is 
// "all functions returning A"; I'm not sure
// even "A (*f)(...)" is an equivalent in modern C/C++
typedef A (*F2)(A,A);
F2 verbs_diadic[] = {0,plus,from,find,0,reshape,cat};
typedef A (*F1)(A);
F1 verbs_monadic[] = {0,id,size,iota,box,shape,0};
int st[26];

bool qp(int a) { return a>='a' && a<='z'; } // remember chars-as-ints
bool qv(int a) { return a<'a'; } // assuming ptrs always get values > 'z'

A exec(int *expr)
{
  int a = expr[0];
  // if(qp(a)){if(e[1]=='=')R st[a-'a']=ex(e+2);a= st[ a-'a'];}
  if (qp(a)) {
    if (expr[1]=='=') {
      // R st[a-'a']=ex(e+2); // K&R C int-ptr equivalence used twice
      A val = exec(expr+2);
      st[a-'a'] = (int)val;
      return val;
    }
    a = st[a-'a'];
  }
  // R qv(a)?(*vm[a])(ex(e+1)):e[1]?(*vd[e[1]])(a,ex(e+2)):(A)a; 
  if (qv(a)) {
    F1 f = verbs_monadic[a];
    return f(exec(expr+1));
  }
  else if (expr[1]) {
    F2 f = verbs_diadic[expr[1]];
    return f((A)a,exec(expr+2));
  }
  else {
    return (A)a;
  }
}

// noun(c){A z;if(c<'0'||c>'9')R 0;z=ga(0,0,0);*z->p=c-'0';R z;}
int noun(int c)
{
  // Note this only gets 1-digit integers!
  A z;
  if (c<'0' || c>'9') return 0;
  z = ga(VECTOR,0,0);
  z->p[0] = c-'0';
  return (int)z;
}
    
// verb(c){I i=0;for(;vt[i];)if(vt[i++]==c)R i;R 0;}
int verb(int c)
{
  for(int i=0; verb_names[i];) {
    if (verb_names[i++]==c)
      return i;
  }
  // Equivalent semantically, but could be a tiny bit slower:
  // for(int i=0; verb_names[i]; i++) {
  //   if (verb_names[i]==c)
  //     return i+1;
  // }
  return 0;
}

// I *wd(s)C *s;{I a,n=strlen(s),*e=ma(n+1);C c;
//  DO(n,e[i]=(a=noun(c=s[i]))?a:(a=verb(c))?a:c);e[n]=0;R e;}

int *words(char *s)
{
  int a;
  int n=strlen(s);
  int *e=alloc(n+1);
  DO(n) {
    char c = s[i];
    e[i] = 
      (a=noun(c)) ? a :
      (a=verb(c)) ? a :
      c;
  }
  e[n]=0;
  return e;
}

// main(){C s[99];while(gets(s))pr(ex(wd(s)));}
int main(int argc, char*argv[])
{
  char s[99];
  while(gets(s)) {
    print(exec(words(s)));
  }
  return 0;
}
