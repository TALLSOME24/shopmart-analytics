# 🧹 Sprint 2 — Data Cleaning Summary
**Analyst:** TALLSOME24
**Date:** 11 March 2026
**Dataset:** Abuja Warehouse January 2026 Sales
**Total Records:** 15 raw → 13 clean

---

## Issues Found & Fixed

| # | Problem | Row Affected | Fix Applied |
|---|---|---|---|
| 1 | Duplicate order ID | ORD-051 | Deleted duplicate row |
| 2 | Wrong date format | ORD-052 | Changed to YYYY-MM-DD |
| 3 | Inconsistent category | ORD-053, ORD-059 | Standardised casing |
| 4 | Missing customer ID | ORD-054 | Set to CUST-UNKNOWN |
| 5 | Inconsistent city | ORD-055 | Standardised to Abuja |
| 6 | Zero quantity | ORD-057 | Deleted invalid row |
| 7 | Negative revenue | ORD-060 | Corrected to ₦90,250 |

---

## Result
Data reduced from 15 to 13 valid records.
All records now have consistent formatting, valid values
and are ready for loading into the main sales table.
