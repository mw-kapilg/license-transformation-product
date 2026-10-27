classdef tSmoothSignal < matlab.unittest.TestCase
    % Tests for smoothSignal, including C code generation with MATLAB Coder.

    methods (Test)
        function knownValues(testCase)
            y = smoothSignal([3; 6; 9; 12]);
            testCase.verifyEqual(y, [3; 4.5; 6; 9]);
        end

        function generatesCCode(testCase)
            import matlab.unittest.fixtures.TemporaryFolderFixture
            outFolder = testCase.applyFixture(TemporaryFolderFixture).Folder;

            cfg = coder.config("lib");
            cfg.GenCodeOnly = true;
            cfg.Toolchain = "CMake";  % generate sources only; no C compiler needed
            codegen("smoothSignal", "-config", cfg, ...
                "-args", {coder.typeof(0, [1024 1], [true false])}, ...
                "-d", outFolder);

            testCase.verifyTrue(isfile(fullfile(outFolder, "smoothSignal.c")), ...
                "Expected generated C source smoothSignal.c.");
        end
    end
end
