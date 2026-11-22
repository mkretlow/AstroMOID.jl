# AstroMOID.jl

Julia package computing the Minimum Orbit Intersection Distance (MOID) of two confocal elliptical orbits.
Registered in the General registry. It's a port of the Wiśniowski & Rickman (2013) Fortran code `moid_v4_fun.f`.

## Layout
- `src/wisric_moid.jl`: the whole algorithm, `wisric_moid(a,e,ω,Ω,i, a,e,ω,Ω,i)`, with angles in rad and the result in the units of `a`
- `src/AstroMOID.jl`: module wrapper that exports `wisric_moid`
- `test/runtests.jl`: asteroid pairs, plus regression cases compared against Fortran results (atol 1e-12 to 1e-14)
- `references/`: the original Fortran source and the paper PDF (both tracked)
- `dev/`, `work/`, `todo/`, `paper/` (JOSS draft): local only, excluded through `.git/info/exclude`; never commit them

## Commands
- Tests: `julia --project -e 'using Pkg; Pkg.test()'`
- Fortran comparison on random orbits: build `dev/libmoid.so` (the command is in the header of `dev/cmp.jl`), then `cd dev && julia cmp.jl`

## Conventions
- Keep the code close to the Fortran reference; any change to the algorithm must still match `moid_v4_fun.f` (check with `dev/cmp.jl`)
- Supported Julia: LTS (1.10) and newer (`[compat] julia = "1.10"`). CI tests `lts` and `1` on Linux, macOS and Windows; there's no coverage reporting
- No docs site (no `docs/`, no docs CI job); README and docstrings are the documentation

## Releasing
1. Bump `version` in `Project.toml`; update `version` and `date-released` in `CITATION.cff`
2. Push, wait for CI to pass, then comment `@JuliaRegistrator register` (optionally with `Release notes:`) on the commit (`gh api repos/mkretlow/AstroMOID.jl/commits/<sha>/comments -f body=...`)
3. After the General PR merges, TagBot creates the tag and GitHub release, and Zenodo archives it
4. Zenodo concept DOI 10.5281/zenodo.23304278 (badge in README) always resolves to the latest version; don't change it per release

## Notes
- Never add an ORCID to citation metadata
- `~/Julia` is a symlink to `~/Astronomy/Julia`, so both paths are this same repo
