# EngEx FPGA Demos

This repository contains FPGA demo projects (e.g., Mandelbrot) targeted at Intel/Altera devices using Quartus.

## Structure

- `fpga/` — Quartus project files, HDL sources, and IP cores
- `fpga-demos/` — Example/demo materials and docs

The `.gitignore` excludes Quartus-generated build artifacts (e.g., `db/`, `incremental_db/`, `greybox_tmp/`, `output_files/`) so only source files are versioned.

## Getting Started

Open the Quartus project under `fpga/` (e.g., `TopLevel.qsf` or `mandelbrot.qpf`), regenerate IP if prompted, then compile and program your device.

## License

Add a license if you intend to share publicly.
