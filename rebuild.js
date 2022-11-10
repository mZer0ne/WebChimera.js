

function build() {
    let pkg = require("./package.json");
    let cmakeJS = require("cmake-js");


    let buildSystem = new cmakeJS.BuildSystem({
        runtimeVersion: pkg.prebuilt.runtimeVersion,
        runtime: pkg.prebuilt.runtime,
        arch: pkg.prebuilt.version
    });

    buildSystem.rebuild().catch(function () {
        process.exit(1);
    });
}

let times = 0;

function begin() {
    try {
        build();
    } catch (e) {
        if (e.code == "MODULE_NOT_FOUND") {
            if (times++ == 5) {
                process.exit(1);
            } else {
                setTimeout(begin, 2000);
            }
        } else {
            process.exit(1);
        }
    }
};

begin();
