# 0 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
# 1 "D:\\Facultate - Github\\Facultate\\GC\\Lab_3\\cmake-build-debug//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
# 1 "C:/msys64/mingw64/include/GLFW/glfw3.h" 1 3
# 33 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3

# 33 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
extern "C" {
# 103 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
# 1 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 1 3 4
# 1 "C:/msys64/mingw64/include/stddef.h" 1 3 4






# 1 "C:/msys64/mingw64/include/crtdefs.h" 1 3 4
# 10 "C:/msys64/mingw64/include/crtdefs.h" 3 4
# 1 "C:/msys64/mingw64/include/corecrt.h" 1 3 4
# 10 "C:/msys64/mingw64/include/corecrt.h" 3 4
# 1 "C:/msys64/mingw64/include/_mingw.h" 1 3 4
# 10 "C:/msys64/mingw64/include/_mingw.h" 3 4
# 1 "C:/msys64/mingw64/include/_mingw_mac.h" 1 3 4
# 108 "C:/msys64/mingw64/include/_mingw_mac.h" 3 4
             
# 117 "C:/msys64/mingw64/include/_mingw_mac.h" 3 4
             
# 326 "C:/msys64/mingw64/include/_mingw_mac.h" 3 4
       
# 405 "C:/msys64/mingw64/include/_mingw_mac.h" 3 4
       
# 11 "C:/msys64/mingw64/include/_mingw.h" 2 3 4
# 1 "C:/msys64/mingw64/include/_mingw_secapi.h" 1 3 4
# 44 "C:/msys64/mingw64/include/_mingw_secapi.h" 3 4
extern "C++" {
template <bool __test, typename __dsttype>
  struct __if_array;
template <typename __dsttype>
  struct __if_array <true, __dsttype> {
    typedef __dsttype __type;
};
}
# 12 "C:/msys64/mingw64/include/_mingw.h" 2 3 4
# 306 "C:/msys64/mingw64/include/_mingw.h" 3 4
# 1 "C:/msys64/mingw64/include/vadefs.h" 1 3 4
# 9 "C:/msys64/mingw64/include/vadefs.h" 3 4
# 1 "C:/msys64/mingw64/include/_mingw.h" 1 3 4
# 685 "C:/msys64/mingw64/include/_mingw.h" 3 4
# 1 "C:/msys64/mingw64/include/sdks/_mingw_ddk.h" 1 3 4
# 686 "C:/msys64/mingw64/include/_mingw.h" 2 3 4
# 10 "C:/msys64/mingw64/include/vadefs.h" 2 3 4




#pragma pack(push,_CRT_PACKING)



extern "C" {





  typedef __builtin_va_list __gnuc_va_list;






  typedef __gnuc_va_list va_list;
# 99 "C:/msys64/mingw64/include/vadefs.h" 3 4
}



#pragma pack(pop)
# 307 "C:/msys64/mingw64/include/_mingw.h" 2 3 4
# 592 "C:/msys64/mingw64/include/_mingw.h" 3 4
extern "C" {
# 604 "C:/msys64/mingw64/include/_mingw.h" 3 4
void __attribute__((__cdecl__)) __debugbreak(void);
extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void __attribute__((__cdecl__)) __debugbreak(void)
{



  __asm__ __volatile__("int {$}3":);





}
# 625 "C:/msys64/mingw64/include/_mingw.h" 3 4
void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) __fastfail(unsigned int code);
extern __inline__ __attribute__((__always_inline__,__gnu_inline__)) void __attribute__((__cdecl__)) __attribute__ ((__noreturn__)) __fastfail(unsigned int code)
{




  __asm__ __volatile__("int {$}0x29"::"c"(code));






  __builtin_unreachable();
}
# 665 "C:/msys64/mingw64/include/_mingw.h" 3 4
const char *__mingw_get_crt_info (void);


}
# 11 "C:/msys64/mingw64/include/corecrt.h" 2 3 4




#pragma pack(push,_CRT_PACKING)
# 35 "C:/msys64/mingw64/include/corecrt.h" 3 4
__extension__ typedef unsigned long long size_t;
# 45 "C:/msys64/mingw64/include/corecrt.h" 3 4
__extension__ typedef long long ssize_t;






typedef size_t rsize_t;
# 62 "C:/msys64/mingw64/include/corecrt.h" 3 4
__extension__ typedef long long intptr_t;
# 75 "C:/msys64/mingw64/include/corecrt.h" 3 4
__extension__ typedef unsigned long long uintptr_t;
# 88 "C:/msys64/mingw64/include/corecrt.h" 3 4
__extension__ typedef long long ptrdiff_t;
# 106 "C:/msys64/mingw64/include/corecrt.h" 3 4
typedef unsigned short wint_t;
typedef unsigned short wctype_t;





typedef int errno_t;




typedef long __time32_t;




__extension__ typedef long long __time64_t;
# 138 "C:/msys64/mingw64/include/corecrt.h" 3 4
typedef __time64_t time_t;
# 430 "C:/msys64/mingw64/include/corecrt.h" 3 4
struct threadlocaleinfostruct;
struct threadmbcinfostruct;
typedef struct threadlocaleinfostruct *pthreadlocinfo;
typedef struct threadmbcinfostruct *pthreadmbcinfo;
struct __lc_time_data;

typedef struct localeinfo_struct {
  pthreadlocinfo locinfo;
  pthreadmbcinfo mbcinfo;
} _locale_tstruct,*_locale_t;



typedef struct tagLC_ID {
  unsigned short wLanguage;
  unsigned short wCountry;
  unsigned short wCodePage;
} LC_ID,*LPLC_ID;




typedef struct threadlocaleinfostruct {





  int refcount;
  unsigned int lc_codepage;
  unsigned int lc_collate_cp;
  unsigned long lc_handle[6];
  LC_ID lc_id[6];
  struct {
    char *locale;
    wchar_t *wlocale;
    int *refcount;
    int *wrefcount;
  } lc_category[6];
  int lc_clike;
  int mb_cur_max;
  int *lconv_intl_refcount;
  int *lconv_num_refcount;
  int *lconv_mon_refcount;
  struct lconv *lconv;
  int *ctype1_refcount;
  unsigned short *ctype1;
  const unsigned short *pctype;
  const unsigned char *pclmap;
  const unsigned char *pcumap;
  struct __lc_time_data *lc_time_curr;

} threadlocinfo;
# 501 "C:/msys64/mingw64/include/corecrt.h" 3 4
#pragma pack(pop)
# 11 "C:/msys64/mingw64/include/crtdefs.h" 2 3 4
# 8 "C:/msys64/mingw64/include/stddef.h" 2 3 4





extern "C" {




  __attribute__ ((__dllimport__)) extern int *__attribute__((__cdecl__)) _errno(void);

  errno_t __attribute__((__cdecl__)) _set_errno(int _Value);
  errno_t __attribute__((__cdecl__)) _get_errno(int *_Value);


  __attribute__ ((__dllimport__)) extern unsigned long __attribute__((__cdecl__)) __threadid(void);

  __attribute__ ((__dllimport__)) extern uintptr_t __attribute__((__cdecl__)) __threadhandle(void);


}
# 424 "C:/msys64/mingw64/include/stddef.h" 3 4
typedef struct {
  long long __max_align_ll __attribute__((__aligned__(__alignof__(long long))));
  long double __max_align_ld __attribute__((__aligned__(__alignof__(long double))));
} max_align_t;
# 2 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 2 3 4
# 104 "C:/msys64/mingw64/include/GLFW/glfw3.h" 2 3




# 1 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdint.h" 1 3 4
# 9 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdint.h" 3 4
# 1 "C:/msys64/mingw64/include/stdint.h" 1 3 4
# 32 "C:/msys64/mingw64/include/stdint.h" 3 4
# 1 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 1 3 4
# 1 "C:/msys64/mingw64/include/stddef.h" 1 3 4
# 2 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 2 3 4
# 33 "C:/msys64/mingw64/include/stdint.h" 2 3 4


typedef signed char int8_t;
typedef unsigned char uint8_t;
typedef short int16_t;
typedef unsigned short uint16_t;
typedef int int32_t;
typedef unsigned uint32_t;
__extension__ typedef long long int64_t;
__extension__ typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef unsigned char uint_least8_t;
typedef short int_least16_t;
typedef unsigned short uint_least16_t;
typedef int int_least32_t;
typedef unsigned uint_least32_t;
__extension__ typedef long long int_least64_t;
__extension__ typedef unsigned long long uint_least64_t;





typedef signed char int_fast8_t;
typedef unsigned char uint_fast8_t;
typedef short int_fast16_t;
typedef unsigned short uint_fast16_t;
typedef int int_fast32_t;
typedef unsigned int uint_fast32_t;
__extension__ typedef long long int_fast64_t;
__extension__ typedef unsigned long long uint_fast64_t;


__extension__ typedef long long intmax_t;
__extension__ typedef unsigned long long uintmax_t;
# 10 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stdint.h" 2 3 4
# 109 "C:/msys64/mingw64/include/GLFW/glfw3.h" 2 3
# 241 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
# 1 "C:/msys64/mingw64/include/GL/gl.h" 1 3
# 15 "C:/msys64/mingw64/include/GL/gl.h" 3
# 1 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 1 3 4
# 1 "C:/msys64/mingw64/include/stddef.h" 1 3 4
# 2 "C:/msys64/mingw64/lib/gcc/x86_64-w64-mingw32/14.2.0/include/stddef.h" 2 3 4
# 16 "C:/msys64/mingw64/include/GL/gl.h" 2 3



extern "C" {


typedef unsigned int GLenum;
typedef unsigned char GLboolean;
typedef unsigned int GLbitfield;
typedef signed char GLbyte;
typedef short GLshort;
typedef int GLint;
typedef int GLsizei;
typedef unsigned char GLubyte;
typedef unsigned short GLushort;
typedef unsigned int GLuint;
typedef float GLfloat;
typedef float GLclampf;
typedef double GLdouble;
typedef double GLclampd;
typedef void GLvoid;
# 684 "C:/msys64/mingw64/include/GL/gl.h" 3
__attribute__((dllimport)) void __attribute__((__stdcall__)) glAccum(GLenum op,GLfloat value);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glAlphaFunc(GLenum func,GLclampf ref);
__attribute__((dllimport)) GLboolean __attribute__((__stdcall__)) glAreTexturesResident(GLsizei n,const GLuint *textures,GLboolean *residences);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glArrayElement(GLint i);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glBegin(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glBindTexture(GLenum target,GLuint texture);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glBitmap(GLsizei width,GLsizei height,GLfloat xorig,GLfloat yorig,GLfloat xmove,GLfloat ymove,const GLubyte *bitmap);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glBlendFunc(GLenum sfactor,GLenum dfactor);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCallList(GLuint list);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCallLists(GLsizei n,GLenum type,const GLvoid *lists);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClear(GLbitfield mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClearAccum(GLfloat red,GLfloat green,GLfloat blue,GLfloat alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClearColor(GLclampf red,GLclampf green,GLclampf blue,GLclampf alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClearDepth(GLclampd depth);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClearIndex(GLfloat c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClearStencil(GLint s);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glClipPlane(GLenum plane,const GLdouble *equation);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3b(GLbyte red,GLbyte green,GLbyte blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3bv(const GLbyte *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3d(GLdouble red,GLdouble green,GLdouble blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3f(GLfloat red,GLfloat green,GLfloat blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3i(GLint red,GLint green,GLint blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3s(GLshort red,GLshort green,GLshort blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3ub(GLubyte red,GLubyte green,GLubyte blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3ubv(const GLubyte *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3ui(GLuint red,GLuint green,GLuint blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3uiv(const GLuint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3us(GLushort red,GLushort green,GLushort blue);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor3usv(const GLushort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4b(GLbyte red,GLbyte green,GLbyte blue,GLbyte alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4bv(const GLbyte *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4d(GLdouble red,GLdouble green,GLdouble blue,GLdouble alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4f(GLfloat red,GLfloat green,GLfloat blue,GLfloat alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4i(GLint red,GLint green,GLint blue,GLint alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4s(GLshort red,GLshort green,GLshort blue,GLshort alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4ub(GLubyte red,GLubyte green,GLubyte blue,GLubyte alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4ubv(const GLubyte *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4ui(GLuint red,GLuint green,GLuint blue,GLuint alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4uiv(const GLuint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4us(GLushort red,GLushort green,GLushort blue,GLushort alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColor4usv(const GLushort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColorMask(GLboolean red,GLboolean green,GLboolean blue,GLboolean alpha);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColorMaterial(GLenum face,GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glColorPointer(GLint size,GLenum type,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCopyPixels(GLint x,GLint y,GLsizei width,GLsizei height,GLenum type);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCopyTexImage1D(GLenum target,GLint level,GLenum internalFormat,GLint x,GLint y,GLsizei width,GLint border);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCopyTexImage2D(GLenum target,GLint level,GLenum internalFormat,GLint x,GLint y,GLsizei width,GLsizei height,GLint border);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCopyTexSubImage1D(GLenum target,GLint level,GLint xoffset,GLint x,GLint y,GLsizei width);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCopyTexSubImage2D(GLenum target,GLint level,GLint xoffset,GLint yoffset,GLint x,GLint y,GLsizei width,GLsizei height);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glCullFace(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDeleteLists(GLuint list,GLsizei range);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDeleteTextures(GLsizei n,const GLuint *textures);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDepthFunc(GLenum func);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDepthMask(GLboolean flag);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDepthRange (GLclampd zNear,GLclampd zFar);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDisable(GLenum cap);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDisableClientState(GLenum array);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDrawArrays(GLenum mode,GLint first,GLsizei count);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDrawBuffer(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDrawElements(GLenum mode,GLsizei count,GLenum type,const GLvoid *indices);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glDrawPixels(GLsizei width,GLsizei height,GLenum format,GLenum type,const GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEdgeFlag(GLboolean flag);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEdgeFlagPointer(GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEdgeFlagv(const GLboolean *flag);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEnable(GLenum cap);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEnableClientState(GLenum array);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEnd(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEndList(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord1d(GLdouble u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord1dv(const GLdouble *u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord1f(GLfloat u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord1fv(const GLfloat *u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord2d(GLdouble u,GLdouble v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord2dv(const GLdouble *u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord2f(GLfloat u,GLfloat v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalCoord2fv(const GLfloat *u);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalMesh1(GLenum mode,GLint i1,GLint i2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalMesh2(GLenum mode,GLint i1,GLint i2,GLint j1,GLint j2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalPoint1(GLint i);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glEvalPoint2(GLint i,GLint j);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFeedbackBuffer(GLsizei size,GLenum type,GLfloat *buffer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFinish(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFlush(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFogf(GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFogfv(GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFogi(GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFogiv(GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFrontFace(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glFrustum(GLdouble left,GLdouble right,GLdouble bottom,GLdouble top,GLdouble zNear,GLdouble zFar);
__attribute__((dllimport)) GLuint __attribute__((__stdcall__)) glGenLists(GLsizei range);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGenTextures(GLsizei n,GLuint *textures);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetBooleanv(GLenum pname,GLboolean *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetClipPlane(GLenum plane,GLdouble *equation);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetDoublev(GLenum pname,GLdouble *params);
__attribute__((dllimport)) GLenum __attribute__((__stdcall__)) glGetError(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetFloatv(GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetIntegerv(GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetLightfv(GLenum light,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetLightiv(GLenum light,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetMapdv(GLenum target,GLenum query,GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetMapfv(GLenum target,GLenum query,GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetMapiv(GLenum target,GLenum query,GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetMaterialfv(GLenum face,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetMaterialiv(GLenum face,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetPixelMapfv(GLenum map,GLfloat *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetPixelMapuiv(GLenum map,GLuint *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetPixelMapusv(GLenum map,GLushort *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetPointerv(GLenum pname,GLvoid **params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetPolygonStipple(GLubyte *mask);
__attribute__((dllimport)) const GLubyte *__attribute__((__stdcall__)) glGetString(GLenum name);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexEnvfv(GLenum target,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexEnviv(GLenum target,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexGendv(GLenum coord,GLenum pname,GLdouble *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexGenfv(GLenum coord,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexGeniv(GLenum coord,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexImage(GLenum target,GLint level,GLenum format,GLenum type,GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexLevelParameterfv(GLenum target,GLint level,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexLevelParameteriv(GLenum target,GLint level,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexParameterfv(GLenum target,GLenum pname,GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glGetTexParameteriv(GLenum target,GLenum pname,GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glHint(GLenum target,GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexMask(GLuint mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexPointer(GLenum type,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexd(GLdouble c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexdv(const GLdouble *c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexf(GLfloat c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexfv(const GLfloat *c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexi(GLint c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexiv(const GLint *c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexs(GLshort c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexsv(const GLshort *c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexub(GLubyte c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glIndexubv(const GLubyte *c);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glInitNames(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glInterleavedArrays(GLenum format,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) GLboolean __attribute__((__stdcall__)) glIsEnabled(GLenum cap);
__attribute__((dllimport)) GLboolean __attribute__((__stdcall__)) glIsList(GLuint list);
__attribute__((dllimport)) GLboolean __attribute__((__stdcall__)) glIsTexture(GLuint texture);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightModelf(GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightModelfv(GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightModeli(GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightModeliv(GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightf(GLenum light,GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightfv(GLenum light,GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLighti(GLenum light,GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLightiv(GLenum light,GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLineStipple(GLint factor,GLushort pattern);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLineWidth(GLfloat width);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glListBase(GLuint base);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLoadIdentity(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLoadMatrixd(const GLdouble *m);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLoadMatrixf(const GLfloat *m);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLoadName(GLuint name);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glLogicOp(GLenum opcode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMap1d(GLenum target,GLdouble u1,GLdouble u2,GLint stride,GLint order,const GLdouble *points);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMap1f(GLenum target,GLfloat u1,GLfloat u2,GLint stride,GLint order,const GLfloat *points);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMap2d(GLenum target,GLdouble u1,GLdouble u2,GLint ustride,GLint uorder,GLdouble v1,GLdouble v2,GLint vstride,GLint vorder,const GLdouble *points);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMap2f(GLenum target,GLfloat u1,GLfloat u2,GLint ustride,GLint uorder,GLfloat v1,GLfloat v2,GLint vstride,GLint vorder,const GLfloat *points);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMapGrid1d(GLint un,GLdouble u1,GLdouble u2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMapGrid1f(GLint un,GLfloat u1,GLfloat u2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMapGrid2d(GLint un,GLdouble u1,GLdouble u2,GLint vn,GLdouble v1,GLdouble v2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMapGrid2f(GLint un,GLfloat u1,GLfloat u2,GLint vn,GLfloat v1,GLfloat v2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMaterialf(GLenum face,GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMaterialfv(GLenum face,GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMateriali(GLenum face,GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMaterialiv(GLenum face,GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMatrixMode(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMultMatrixd(const GLdouble *m);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glMultMatrixf(const GLfloat *m);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNewList(GLuint list,GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3b (GLbyte nx,GLbyte ny,GLbyte nz);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3bv(const GLbyte *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3d(GLdouble nx,GLdouble ny,GLdouble nz);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3f(GLfloat nx,GLfloat ny,GLfloat nz);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3i(GLint nx,GLint ny,GLint nz);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3s(GLshort nx,GLshort ny,GLshort nz);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormal3sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glNormalPointer(GLenum type,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glOrtho(GLdouble left,GLdouble right,GLdouble bottom,GLdouble top,GLdouble zNear,GLdouble zFar);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPassThrough(GLfloat token);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelMapfv(GLenum map,GLsizei mapsize,const GLfloat *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelMapuiv(GLenum map,GLsizei mapsize,const GLuint *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelMapusv(GLenum map,GLsizei mapsize,const GLushort *values);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelStoref(GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelStorei(GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelTransferf(GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelTransferi(GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPixelZoom(GLfloat xfactor,GLfloat yfactor);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPointSize(GLfloat size);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPolygonMode(GLenum face,GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPolygonOffset(GLfloat factor,GLfloat units);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPolygonStipple(const GLubyte *mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPopAttrib(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPopClientAttrib(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPopMatrix(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPopName(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPrioritizeTextures(GLsizei n,const GLuint *textures,const GLclampf *priorities);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPushAttrib(GLbitfield mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPushClientAttrib(GLbitfield mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPushMatrix(void);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glPushName(GLuint name);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2d(GLdouble x,GLdouble y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2f(GLfloat x,GLfloat y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2i(GLint x,GLint y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2s(GLshort x,GLshort y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos2sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3d(GLdouble x,GLdouble y,GLdouble z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3f(GLfloat x,GLfloat y,GLfloat z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3i(GLint x,GLint y,GLint z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3s(GLshort x,GLshort y,GLshort z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos3sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4d(GLdouble x,GLdouble y,GLdouble z,GLdouble w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4f(GLfloat x,GLfloat y,GLfloat z,GLfloat w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4i(GLint x,GLint y,GLint z,GLint w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4s(GLshort x,GLshort y,GLshort z,GLshort w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRasterPos4sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glReadBuffer(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glReadPixels(GLint x,GLint y,GLsizei width,GLsizei height,GLenum format,GLenum type,GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectd(GLdouble x1,GLdouble y1,GLdouble x2,GLdouble y2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectdv(const GLdouble *v1,const GLdouble *v2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectf(GLfloat x1,GLfloat y1,GLfloat x2,GLfloat y2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectfv(const GLfloat *v1,const GLfloat *v2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRecti(GLint x1,GLint y1,GLint x2,GLint y2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectiv(const GLint *v1,const GLint *v2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRects(GLshort x1,GLshort y1,GLshort x2,GLshort y2);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRectsv(const GLshort *v1,const GLshort *v2);
__attribute__((dllimport)) GLint __attribute__((__stdcall__)) glRenderMode(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRotated(GLdouble angle,GLdouble x,GLdouble y,GLdouble z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glRotatef(GLfloat angle,GLfloat x,GLfloat y,GLfloat z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glScaled(GLdouble x,GLdouble y,GLdouble z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glScalef(GLfloat x,GLfloat y,GLfloat z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glScissor(GLint x,GLint y,GLsizei width,GLsizei height);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glSelectBuffer(GLsizei size,GLuint *buffer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glShadeModel(GLenum mode);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glStencilFunc(GLenum func,GLint ref,GLuint mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glStencilMask(GLuint mask);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glStencilOp(GLenum fail,GLenum zfail,GLenum zpass);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1d(GLdouble s);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1f(GLfloat s);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1i(GLint s);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1s(GLshort s);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord1sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2d(GLdouble s,GLdouble t);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2f(GLfloat s,GLfloat t);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2i(GLint s,GLint t);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2s(GLshort s,GLshort t);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord2sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3d(GLdouble s,GLdouble t,GLdouble r);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3f(GLfloat s,GLfloat t,GLfloat r);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3i(GLint s,GLint t,GLint r);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3s(GLshort s,GLshort t,GLshort r);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord3sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4d(GLdouble s,GLdouble t,GLdouble r,GLdouble q);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4f(GLfloat s,GLfloat t,GLfloat r,GLfloat q);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4i(GLint s,GLint t,GLint r,GLint q);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4s(GLshort s,GLshort t,GLshort r,GLshort q);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoord4sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexCoordPointer(GLint size,GLenum type,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexEnvf(GLenum target,GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexEnvfv(GLenum target,GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexEnvi(GLenum target,GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexEnviv(GLenum target,GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGend(GLenum coord,GLenum pname,GLdouble param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGendv(GLenum coord,GLenum pname,const GLdouble *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGenf(GLenum coord,GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGenfv(GLenum coord,GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGeni(GLenum coord,GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexGeniv(GLenum coord,GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexImage1D(GLenum target,GLint level,GLint internalformat,GLsizei width,GLint border,GLenum format,GLenum type,const GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexImage2D(GLenum target,GLint level,GLint internalformat,GLsizei width,GLsizei height,GLint border,GLenum format,GLenum type,const GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexParameterf(GLenum target,GLenum pname,GLfloat param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexParameterfv(GLenum target,GLenum pname,const GLfloat *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexParameteri(GLenum target,GLenum pname,GLint param);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexParameteriv(GLenum target,GLenum pname,const GLint *params);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexSubImage1D(GLenum target,GLint level,GLint xoffset,GLsizei width,GLenum format,GLenum type,const GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTexSubImage2D(GLenum target,GLint level,GLint xoffset,GLint yoffset,GLsizei width,GLsizei height,GLenum format,GLenum type,const GLvoid *pixels);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTranslated(GLdouble x,GLdouble y,GLdouble z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glTranslatef(GLfloat x,GLfloat y,GLfloat z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2d(GLdouble x,GLdouble y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2f(GLfloat x,GLfloat y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2i(GLint x,GLint y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2s(GLshort x,GLshort y);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex2sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3d(GLdouble x,GLdouble y,GLdouble z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3f(GLfloat x,GLfloat y,GLfloat z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3i(GLint x,GLint y,GLint z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3s(GLshort x,GLshort y,GLshort z);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex3sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4d(GLdouble x,GLdouble y,GLdouble z,GLdouble w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4dv(const GLdouble *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4f(GLfloat x,GLfloat y,GLfloat z,GLfloat w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4fv(const GLfloat *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4i(GLint x,GLint y,GLint z,GLint w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4iv(const GLint *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4s(GLshort x,GLshort y,GLshort z,GLshort w);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertex4sv(const GLshort *v);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glVertexPointer(GLint size,GLenum type,GLsizei stride,const GLvoid *pointer);
__attribute__((dllimport)) void __attribute__((__stdcall__)) glViewport(GLint x,GLint y,GLsizei width,GLsizei height);

typedef void (__attribute__((__stdcall__)) *PFNGLARRAYELEMENTEXTPROC)(GLint i);
typedef void (__attribute__((__stdcall__)) *PFNGLDRAWARRAYSEXTPROC)(GLenum mode,GLint first,GLsizei count);
typedef void (__attribute__((__stdcall__)) *PFNGLVERTEXPOINTEREXTPROC)(GLint size,GLenum type,GLsizei stride,GLsizei count,const GLvoid *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLNORMALPOINTEREXTPROC)(GLenum type,GLsizei stride,GLsizei count,const GLvoid *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLCOLORPOINTEREXTPROC)(GLint size,GLenum type,GLsizei stride,GLsizei count,const GLvoid *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLINDEXPOINTEREXTPROC)(GLenum type,GLsizei stride,GLsizei count,const GLvoid *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLTEXCOORDPOINTEREXTPROC)(GLint size,GLenum type,GLsizei stride,GLsizei count,const GLvoid *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLEDGEFLAGPOINTEREXTPROC)(GLsizei stride,GLsizei count,const GLboolean *pointer);
typedef void (__attribute__((__stdcall__)) *PFNGLGETPOINTERVEXTPROC)(GLenum pname,GLvoid **params);
typedef void (__attribute__((__stdcall__)) *PFNGLARRAYELEMENTARRAYEXTPROC)(GLenum mode,GLsizei count,const GLvoid *pi);
typedef void (__attribute__((__stdcall__)) *PFNGLDRAWRANGEELEMENTSWINPROC)(GLenum mode,GLuint start,GLuint end,GLsizei count,GLenum type,const GLvoid *indices);
typedef void (__attribute__((__stdcall__)) *PFNGLADDSWAPHINTRECTWINPROC)(GLint x,GLint y,GLsizei width,GLsizei height);
typedef void (__attribute__((__stdcall__)) *PFNGLCOLORTABLEEXTPROC)(GLenum target,GLenum internalFormat,GLsizei width,GLenum format,GLenum type,const GLvoid *data);
typedef void (__attribute__((__stdcall__)) *PFNGLCOLORSUBTABLEEXTPROC)(GLenum target,GLsizei start,GLsizei count,GLenum format,GLenum type,const GLvoid *data);
typedef void (__attribute__((__stdcall__)) *PFNGLGETCOLORTABLEEXTPROC)(GLenum target,GLenum format,GLenum type,GLvoid *data);
typedef void (__attribute__((__stdcall__)) *PFNGLGETCOLORTABLEPARAMETERIVEXTPROC)(GLenum target,GLenum pname,GLint *params);
typedef void (__attribute__((__stdcall__)) *PFNGLGETCOLORTABLEPARAMETERFVEXTPROC)(GLenum target,GLenum pname,GLfloat *params);


}
# 242 "C:/msys64/mingw64/include/GLFW/glfw3.h" 2 3
# 1365 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (*GLFWglproc)(void);
# 1379 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (*GLFWvkproc)(void);
# 1391 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWmonitor GLFWmonitor;
# 1403 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWwindow GLFWwindow;
# 1415 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWcursor GLFWcursor;
# 1468 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void* (* GLFWallocatefun)(size_t size, void* user);
# 1524 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void* (* GLFWreallocatefun)(void* block, size_t size, void* user);
# 1566 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWdeallocatefun)(void* block, void* user);
# 1590 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWerrorfun)(int error_code, const char* description);
# 1613 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowposfun)(GLFWwindow* window, int xpos, int ypos);
# 1635 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowsizefun)(GLFWwindow* window, int width, int height);
# 1655 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowclosefun)(GLFWwindow* window);
# 1675 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowrefreshfun)(GLFWwindow* window);
# 1696 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowfocusfun)(GLFWwindow* window, int focused);
# 1717 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowiconifyfun)(GLFWwindow* window, int iconified);
# 1738 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowmaximizefun)(GLFWwindow* window, int maximized);
# 1759 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWframebuffersizefun)(GLFWwindow* window, int width, int height);
# 1780 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWwindowcontentscalefun)(GLFWwindow* window, float xscale, float yscale);
# 1806 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWmousebuttonfun)(GLFWwindow* window, int button, int action, int mods);
# 1829 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWcursorposfun)(GLFWwindow* window, double xpos, double ypos);
# 1850 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWcursorenterfun)(GLFWwindow* window, int entered);
# 1871 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWscrollfun)(GLFWwindow* window, double xoffset, double yoffset);
# 1897 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWkeyfun)(GLFWwindow* window, int key, int scancode, int action, int mods);
# 1918 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWcharfun)(GLFWwindow* window, unsigned int codepoint);
# 1945 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWcharmodsfun)(GLFWwindow* window, unsigned int codepoint, int mods);
# 1969 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWdropfun)(GLFWwindow* window, int path_count, const char* paths[]);
# 1990 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWmonitorfun)(GLFWmonitor* monitor, int event);
# 2011 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef void (* GLFWjoystickfun)(int jid, int event);
# 2026 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWvidmode
{


    int width;


    int height;


    int redBits;


    int greenBits;


    int blueBits;


    int refreshRate;
} GLFWvidmode;
# 2060 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWgammaramp
{


    unsigned short* red;


    unsigned short* green;


    unsigned short* blue;


    unsigned int size;
} GLFWgammaramp;
# 2089 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWimage
{


    int width;


    int height;


    unsigned char* pixels;
} GLFWimage;
# 2113 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWgamepadstate
{



    unsigned char buttons[15];



    float axes[6];
} GLFWgamepadstate;
# 2137 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
typedef struct GLFWallocator
{



    GLFWallocatefun allocate;



    GLFWreallocatefun reallocate;



    GLFWdeallocatefun deallocate;



    void* user;
} GLFWallocator;
# 2220 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwInit(void);
# 2254 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwTerminate(void);
# 2286 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwInitHint(int hint, int value);
# 2317 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwInitAllocator(const GLFWallocator* allocator);
# 2392 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetVersion(int* major, int* minor, int* rev);
# 2426 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetVersionString(void);
# 2457 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetError(const char** description);
# 2503 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun callback);
# 2524 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetPlatform(void);
# 2548 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwPlatformSupported(int platform);
# 2577 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWmonitor** glfwGetMonitors(int* count);
# 2601 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWmonitor* glfwGetPrimaryMonitor(void);
# 2626 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetMonitorPos(GLFWmonitor* monitor, int* xpos, int* ypos);
# 2657 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetMonitorWorkarea(GLFWmonitor* monitor, int* xpos, int* ypos, int* width, int* height);
# 2692 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetMonitorPhysicalSize(GLFWmonitor* monitor, int* widthMM, int* heightMM);
# 2727 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetMonitorContentScale(GLFWmonitor* monitor, float* xscale, float* yscale);
# 2753 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetMonitorName(GLFWmonitor* monitor);
# 2779 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetMonitorUserPointer(GLFWmonitor* monitor, void* pointer);
# 2803 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void* glfwGetMonitorUserPointer(GLFWmonitor* monitor);
# 2833 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun callback);
# 2867 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const GLFWvidmode* glfwGetVideoModes(GLFWmonitor* monitor, int* count);
# 2895 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const GLFWvidmode* glfwGetVideoMode(GLFWmonitor* monitor);
# 2928 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetGamma(GLFWmonitor* monitor, float gamma);
# 2958 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor* monitor);
# 2999 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetGammaRamp(GLFWmonitor* monitor, const GLFWgammaramp* ramp);
# 3018 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwDefaultWindowHints(void);
# 3053 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwWindowHint(int hint, int value);
# 3091 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwWindowHintString(int hint, const char* value);
# 3235 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindow* glfwCreateWindow(int width, int height, const char* title, GLFWmonitor* monitor, GLFWwindow* share);
# 3264 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwDestroyWindow(GLFWwindow* window);
# 3284 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwWindowShouldClose(GLFWwindow* window);
# 3306 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowShouldClose(GLFWwindow* window, int value);
# 3338 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetWindowTitle(GLFWwindow* window);
# 3364 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowTitle(GLFWwindow* window, const char* title);
# 3413 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowIcon(GLFWwindow* window, int count, const GLFWimage* images);
# 3445 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetWindowPos(GLFWwindow* window, int* xpos, int* ypos);
# 3480 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowPos(GLFWwindow* window, int xpos, int ypos);
# 3510 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetWindowSize(GLFWwindow* window, int* width, int* height);
# 3553 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowSizeLimits(GLFWwindow* window, int minwidth, int minheight, int maxwidth, int maxheight);
# 3596 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowAspectRatio(GLFWwindow* window, int numer, int denom);
# 3634 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowSize(GLFWwindow* window, int width, int height);
# 3663 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetFramebufferSize(GLFWwindow* window, int* width, int* height);
# 3700 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetWindowFrameSize(GLFWwindow* window, int* left, int* top, int* right, int* bottom);
# 3733 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetWindowContentScale(GLFWwindow* window, float* xscale, float* yscale);
# 3760 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 float glfwGetWindowOpacity(GLFWwindow* window);
# 3792 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowOpacity(GLFWwindow* window, float opacity);
# 3824 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwIconifyWindow(GLFWwindow* window);
# 3851 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwRestoreWindow(GLFWwindow* window);
# 3876 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwMaximizeWindow(GLFWwindow* window);
# 3908 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwShowWindow(GLFWwindow* window);
# 3930 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwHideWindow(GLFWwindow* window);
# 3969 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwFocusWindow(GLFWwindow* window);
# 3996 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwRequestWindowAttention(GLFWwindow* window);
# 4018 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* window);
# 4074 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowMonitor(GLFWwindow* window, GLFWmonitor* monitor, int xpos, int ypos, int width, int height, int refreshRate);
# 4111 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetWindowAttrib(GLFWwindow* window, int attrib);
# 4153 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowAttrib(GLFWwindow* window, int attrib, int value);
# 4176 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetWindowUserPointer(GLFWwindow* window, void* pointer);
# 4197 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void* glfwGetWindowUserPointer(GLFWwindow* window);
# 4232 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun callback);
# 4264 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun callback);
# 4304 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun callback);
# 4340 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun callback);
# 4375 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun callback);
# 4405 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun callback);
# 4435 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowmaximizefun glfwSetWindowMaximizeCallback(GLFWwindow* window, GLFWwindowmaximizefun callback);
# 4465 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun callback);
# 4496 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindowcontentscalefun glfwSetWindowContentScaleCallback(GLFWwindow* window, GLFWwindowcontentscalefun callback);
# 4534 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwPollEvents(void);
# 4579 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwWaitEvents(void);
# 4628 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwWaitEventsTimeout(double timeout);
# 4648 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwPostEmptyEvent(void);
# 4673 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetInputMode(GLFWwindow* window, int mode);
# 4738 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetInputMode(GLFWwindow* window, int mode, int value);
# 4767 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwRawMouseMotionSupported(void);
# 4835 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetKeyName(int key, int scancode);
# 4862 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetKeyScancode(int key);
# 4901 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetKey(GLFWwindow* window, int key);
# 4930 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetMouseButton(GLFWwindow* window, int button);
# 4968 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwGetCursorPos(GLFWwindow* window, double* xpos, double* ypos);
# 5008 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetCursorPos(GLFWwindow* window, double xpos, double ypos);
# 5046 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcursor* glfwCreateCursor(const GLFWimage* image, int xhot, int yhot);
# 5094 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcursor* glfwCreateStandardCursor(int shape);
# 5121 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwDestroyCursor(GLFWcursor* cursor);
# 5148 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetCursor(GLFWwindow* window, GLFWcursor* cursor);
# 5198 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun callback);
# 5241 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun callback);
# 5283 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun callback);
# 5320 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun callback);
# 5352 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun callback);
# 5383 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun callback);
# 5417 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun callback);
# 5452 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun callback);
# 5476 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwJoystickPresent(int jid);
# 5509 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const float* glfwGetJoystickAxes(int jid, int* count);
# 5550 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const unsigned char* glfwGetJoystickButtons(int jid, int* count);
# 5607 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const unsigned char* glfwGetJoystickHats(int jid, int* count);
# 5638 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetJoystickName(int jid);
# 5679 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetJoystickGUID(int jid);
# 5705 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetJoystickUserPointer(int jid, void* pointer);
# 5729 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void* glfwGetJoystickUserPointer(int jid);
# 5757 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwJoystickIsGamepad(int jid);
# 5793 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun callback);
# 5827 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwUpdateGamepadMappings(const char* string);
# 5859 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetGamepadName(int jid);
# 5897 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwGetGamepadState(int jid, GLFWgamepadstate* state);
# 5927 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetClipboardString(GLFWwindow* window, const char* string);
# 5962 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char* glfwGetClipboardString(GLFWwindow* window);
# 5992 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 double glfwGetTime(void);
# 6022 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSetTime(double time);
# 6044 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 uint64_t glfwGetTimerValue(void);
# 6064 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 uint64_t glfwGetTimerFrequency(void);
# 6109 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwMakeContextCurrent(GLFWwindow* window);
# 6130 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWwindow* glfwGetCurrentContext(void);
# 6164 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSwapBuffers(GLFWwindow* window);
# 6210 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 void glfwSwapInterval(int interval);
# 6248 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwExtensionSupported(const char* extension);
# 6290 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 GLFWglproc glfwGetProcAddress(const char* procname);
# 6316 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 int glfwVulkanSupported(void);
# 6360 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
 const char** glfwGetRequiredInstanceExtensions(uint32_t* count);
# 6543 "C:/msys64/mingw64/include/GLFW/glfw3.h" 3
}
# 2 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp" 2

# 2 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
int main(void)
{
    GLFWwindow* window;

    if (!glfwInit())
        return -1;

    window = glfwCreateWindow(640, 480, "Hello World", 
# 9 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp" 3 4
                                                      __null
# 9 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
                                                          , 
# 9 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp" 3 4
                                                            __null
# 9 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
                                                                );
    if (!window)
    {
        glfwTerminate();
        return -1;
    }

    glfwMakeContextCurrent(window);

    while (!glfwWindowShouldClose(window))
    {

        glClearColor(1.0f, 0.0f, 0.0f, 1.0f);
        glClear(
# 22 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp" 3
               0x00004000
# 22 "D:/Facultate - Github/Facultate/GC/Lab_3/main.cpp"
                                  );

        glfwSwapBuffers(window);

        glfwPollEvents();
    }
    glfwTerminate();
    return 0;
}
