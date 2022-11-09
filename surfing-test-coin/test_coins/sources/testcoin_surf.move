module 0x0::surf {
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// SURF for test
    struct SURF has drop {}

    fun init(witness: SURF, ctx: &mut TxContext) {
        transfer::transfer(
            coin::create_currency(witness, 8, ctx),
            tx_context::sender(ctx)
        );
    }
}
