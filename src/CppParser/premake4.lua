clang_msvc_flags =
{
  "/wd4146", "/wd4244", "/wd4800", "/wd4345",
  "/wd4355", "/wd4996", "/wd4624", "/wd4291",
  "/wd4251"
}

project "CppSharp.CppParser"
  
  kind "SharedLib"
  language "C++"
  SetupNativeProject()
  flags { common_flags }
  flags { "NoRTTI" }

  configuration "vs*"
    buildoptions { clang_msvc_flags }
    files { "VSLookup.cpp" }    

  configuration "*"
  
  files
  {
    "*.h",
    "*.cpp",
    "*.lua"
  }
  
  includedirs
  {
    "../../deps/LLVM/include",
    "../../deps/LLVM/build/include",
    "../../deps/LLVM/tools/clang/include",
    "../../deps/LLVM/tools/clang/lib",
    "../../deps/LLVM/build/tools/clang/include"
  }
  
  configuration { "Debug", "vs*" }
    libdirs { "../../deps/LLVM/build/lib/Debug" }

  configuration { "Release", "vs*" }
    libdirs { "../../deps/LLVM/build/lib/RelWithDebInfo" }

  configuration "not vs*"
    defines { "__STDC_CONSTANT_MACROS", "__STDC_LIMIT_MACROS" }
    libdirs { "../../deps/LLVM/build/lib" }

  configuration "macosx"
    links { "c++", "curses", "pthread", "z" }
  
  configuration "*"
  
  links
  {
    "clangAnalysis",
    "clangAST",
    "clangBasic",
    "clangCodeGen",
    "clangDriver",
    "clangEdit",
    "clangFrontend",
    "clangLex",
    "clangParse",
    "clangSema",
    "clangSerialization",
    "LLVMAnalysis",
    "LLVMAsmParser",
    "LLVMBitReader",
    "LLVMBitWriter",
    "LLVMCodeGen",
    "LLVMCore",
    "LLVMipa",
    "LLVMipo",
    "LLVMInstCombine",
    "LLVMInstrumentation",
    "LLVMIRReader",
    "LLVMLinker",
    "LLVMMC",
    "LLVMMCParser",
    "LLVMObjCARCOpts",
    "LLVMObject",
    "LLVMOption",
    "LLVMScalarOpts",
    "LLVMSupport",
    "LLVMTarget",
    "LLVMTransformUtils",
    "LLVMVectorize",
    "LLVMX86AsmParser",
    "LLVMX86AsmPrinter",
    "LLVMX86Desc",
    "LLVMX86Info",
    "LLVMX86Utils",
  }

include ("Bindings")