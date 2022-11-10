const pkg = require("./package.json");

function build() {
    var cmakeJS = require("cmake-js");

    var defaultRuntime = "nw";
    var defaultRuntimeVersion = "0.12.3";
    var defaultWinArch = "ia32";

    var options = {
        runtimeVersion: pkg.prebuilt.runtimeVersion || undefined,
        runtime: pkg.prebuilt.runtime || undefined,
        arch: pkg.prebuilt.version || undefined
    };

    var buildSystem = new cmakeJS.BuildSystem(options);

    if (buildSystem.options.runtime == undefined) {
        buildSystem.options.runtime = defaultRuntime;
    }

    if (buildSystem.options.runtimeVersion == undefined) {
        buildSystem.options.runtimeVersion = defaultRuntimeVersion;
    }

    if (buildSystem.options.arch == undefined && process.platform == "win32") {
        buildSystem.options.arch = defaultWinArch;
    }

    buildSystem.rebuild().catch(function () {
        process.exit(1);
    });
}

var times = 0;

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
