# Surfing AMM Swap

Assume the package contains of coin SURF and USDT is 0xf2ffc3f7d733a56d29a47eb95bd9fb3b21072320

```bash
export SURF="0xf2ffc3f7d733a56d29a47eb95bd9fb3b21072320::surf::SURF"
export USDT="0xf2ffc3f7d733a56d29a47eb95bd9fb3b21072320::usdt::USDT"
export SUI="0x2::sui::SUI"
```

```bash
sui client publish --gas-budget 10000
```

```bash
export package=0x00db3ba929b8b70ae73ec4d5e84be2a96479f436
```

```bash
export global=0x19508cff3126a9d962c04d782d89551a9bec47de
```

```bash
sui client objects
```

```bash
export surf_coin=0x4bc737286846086d9d501626ed3ea8fc7f93aa96
export usdt_coin=0x2f59b9ad4a69c579fb00bc8c8af40fee1f9a1745
```

```bash
sui client call --gas-budget 10000 \
  --package=$package \
  --module=interface \
  --function=add_liquidity \
  --args $global $surf_coin 1 $usdt_coin 1  \
  --type-args $SURF $USDT 
```


LP object: https://explorer.devnet.sui.io/objects/0x9846bf8b441d30145f9943e546a83d2170667b98

Pool object: https://explorer.devnet.sui.io/objects/0xcc6d139ee5593fe0b0d6a80d781b86ff1dbf6442

```bash
export lp_usdt_surf=0x9846bf8b441d30145f9943e546a83d2170667b98
export pool_usdt_surf=0xcdb200ee09980257046698f9fa3a515d51177b33
```


```bash
sui client split-coin --gas-budget 10000 \
  --coin-id $lp_usdt_surf \
  --amounts 45000
```

```bash
export lp_usdt_surf2=0xb3ee09ab8acb508cf265a9a7d77edbc22117e911
```

```bash
sui client call --gas-budget 10000 \
  --package=$package \
  --module=interface \
  --function=remove_liquidity \
  --args $global $lp_usdt_surf2 \
  --type-args $SURF $USDT 
```

```bash
export new_usdt_coin=0x4300ca7bef543babda2c5d1b78067afc54216d13
export new_surf_coin=0xd0d5cbba5b75362942ecaab10376d1dc1238fddf
```

## USDT -> SURF

```bash
sui client call --gas-budget 10000 \
  --package=$package \
  --module=interface \
  --function=swap \
  --args $global $new_usdt_coin 1  \
  --type-args $USDT $SURF
```
  
out_surf_coin=0xe3e3ad4bb99cf90bc2bae093a6b89df2afb26768

## SURF -> USDT

```bash
sui client call --gas-budget 10000 \
  --package=$package \
  --module=interface \
  --function=swap \
  --args $global $out_surf_coin 1 \
  --type-args $SURF $USDT 
```




