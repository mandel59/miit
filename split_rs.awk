#!/usr/bin/awk -f
BEGIN {
  FS = ",";
  OFS = ",";
}
$5 != "" {print $1, $5, $6;}
$7 != "" {print $1, $7, $8;}
$9 != "" {print $1, $9, $10;}
$11 != "" {print $1, $11, $12;}
