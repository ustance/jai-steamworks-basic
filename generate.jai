
LIB_PATH :: "C:/repos/deus_mantle/modules/cool_steam/lib";
STEAMWORKS_PATH :: "D:/steamworks/sdk/public";

#run {
    set_build_options_dc(.{do_output = false});
    
    generate_bindings();    
}

//
// Changed Msvc_Destructor_Flags in the generated file to s32
//

headers :: string.[
    // clang won't be able to find other #include "steam/*.h" files
    // I just quick fixed it by changing includes in steam_api_flat.h from "steam/*.h" to "*.h"
    //
    // Anyway, steam_api_flat have functions (SteamAPI_SteamUser_v023, etc.) that we need to actually do something useful
    "steam/steam_api_flat.h",
];


generate_bindings :: () {
    output_filename := "generated_steam.jai";
    
    options: Generate_Bindings_Options;
    {
        using options;
        
        array_add(*libpaths, LIB_PATH);
        
        array_add(*libnames, "steam_api64");
        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");
        array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
        
        for headers {
            array_add(*source_files, tprint("%/%", STEAMWORKS_PATH, it));
        }
        
        auto_detect_enum_prefixes = true;
        generate_compile_time_struct_checks = false;
    }
    
    builder, ok := generate_bindings(options);
    assert(ok);
    
    str := builder_to_string(*builder);
    
    ok = write_entire_file(output_filename, str);
    assert(ok);
}

#import "String";
#import "Bindings_Generator";
#import "Basic";
#import "Compiler";
#import "File";