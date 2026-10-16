pybind11_add_module(pyscylla "module.cpp")

target_link_libraries(pyscylla PRIVATE ScyllaLib)

if(MSVC)
  target_link_options(pyscylla PRIVATE
      "/LIBPATH:$ENV{VCToolsInstallDir}atlmfc/lib/spectre/$<IF:$<EQUAL:${CMAKE_SIZEOF_VOID_P},8>,x64,x86>"
  )
endif()
