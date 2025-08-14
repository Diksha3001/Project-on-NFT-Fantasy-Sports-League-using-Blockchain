module MyModule::FantasySportsLeague {

    use aptos_framework::signer;
    use std::vector;

    /// Store player data (simulating NFT ownership + fantasy points)
    struct Player has store, key {
        name: vector<u8>,
        points: u64
    }

    /// Register a new player with starting points
    public fun register_player(account: &signer, name: vector<u8>) {
        let player = Player {
            name,
            points: 0
        };
        move_to(account, player);
    }

    /// Update player points (can be called by player themself for simplicity)
    public fun update_points(account: &signer, new_points: u64) acquires Player {
        let p = borrow_global_mut<Player>(signer::address_of(account));
        p.points = new_points;
    }
}
