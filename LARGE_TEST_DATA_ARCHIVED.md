# Large test data archived outside this mirror

This GitHub repository is a **code-only mirror**. Six large binary test/reference
files were removed from history because GitHub rejects git objects over 100 MB
and Git LFS objects over 2 GB, and pushing them was not worthwhile for a
one-time archive.

| File | Size (bytes) |
|---|---:|
| `test/test1/eabbb9d9-e626-4fa5-ac58-16222a649b59_gdc_realn_rehead.bam` | 3,518,528,227 |
| `test/reference.fna.1` | 603,606,647 |
| `test/reference.fna.1.bwt` | 593,382,980 |
| `test/reference.fna.1.sa` | 296,691,504 |
| `test/reference.fna.1.pac` | 148,345,726 |
| `test/test1/single/eabbb9d9-e626-4fa5-ac58-16222a649b59_gdc_realn_rehead_unmappedone.fastq` | 135,058,065 |

## Where the data is preserved

- Original repository with full history: https://bitbucket.org/charade/coreprobe
  (master `de8d034f9f7deacb4e24ceedee264034b1bacad2`)
- Full offline bundle kept on the migration machine:
  `coreprobe_full_backup.bundle` (~4.17 GiB, restore with `git bundle verify`
  then `git clone`).
- The five LFS-eligible files are additionally stored as Git LFS objects in the
  migration working copy.

## Regenerating the BWA index

`reference.fna.1.bwt`, `.sa`, `.pac` (plus `.amb` and `.ann`) are BWA index
artifacts. With `reference.fna.1` restored, regenerate them with:

```
bwa index test/reference.fna.1
```
