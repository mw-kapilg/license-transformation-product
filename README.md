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
