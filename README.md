# signal-utils

Small MATLAB utilities for unit conversion and signal smoothing. The smoothing
routine is also delivered as generated C code for an embedded target.

- `src/` — library functions
- `tests/` — unit tests (MATLAB unit testing framework), including a test that
  generates C code for `smoothSignal`

Run the tests locally from the repository root:

```matlab
addpath("src")
results = runtests("tests")
```

## Continuous integration

`.github/workflows/ci.yml` runs the tests on GitHub Actions for every push to
`main` and every pull request. It installs MATLAB and MATLAB Coder with
`matlab-actions/setup-matlab`.

MATLAB Coder is a transformation product, so the automatic licensing that
MATLAB actions give public repositories does not cover it. The workflow needs
a [MATLAB batch licensing token](https://github.com/mathworks-ref-arch/matlab-dockerfile/blob/main/alternates/non-interactive/MATLAB-BATCH.md#matlab-batch-licensing-token)
saved as a repository secret called `MLM_LICENSE_TOKEN`
(**Settings → Secrets and variables → Actions**).
