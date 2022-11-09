# Test coins


```bash
export owner=0x636ea5d3d392935a9a6d9541aceaeb0904e525c7
```

```bash
sui client publish --gas-budget 10000
```

```bash
package=0x635cee765e0cc73c23c8f4520545a38d09da9689
```

```bash
usdt_cap=0x720c8144b53d0c34d0bf2476b55955398325dee1
```

```bash
surf_cap=0x6b430143a301ffab076f5bd328013dd9cd3424ce
```

```bash
sui client call \
  --gas-budget 10000 \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --args $usdt_cap \
      100000000 \
      $owner \
  --type-args $package::usdt::USDT
```

```bash
sui client call \
  --gas-budget 10000 \
  --package 0x2 \
  --module coin \
  --function mint_and_transfer \
  --args $surf_cap \
      100000000 \
      $owner \
  --type-args $package::surf::SURF
```

