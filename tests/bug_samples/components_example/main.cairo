#[starknet::contract]
mod MyContract {
    use starknet::ContractAddress;
    use hello_scarb::interfaces::IOwnable;
    use hello_scarb::a::a;

    #[storage]
    struct Storage { // #[nested(v0)]
    // a: A::Storage,
    }

    #[event]
    #[derive(Drop, starknet::Event)]
    enum Event { // A: a::Event, 
    }

    impl OwnableImpl of IOwnable<ContractState> {
        fn is_owner(self: @ContractState, user: ContractAddress) -> bool {
            true
        }
    }

    //component!(name=a, storage=a, event=A)
    // autogen.
    impl HasComponentaImpl of a::HasComponent<ContractState> {
        fn get_component(self: @ContractState) -> @a::ComponentState<ContractState> {
            // self.a
            @a::ComponentState { data: a::DataVar {} }
        }
        fn get_component_mut(ref self: ContractState) -> a::ComponentState<ContractState> {
            // unsafe something.
            a::ComponentState { data: a::DataVar {} }
        }
        fn get_contract(self: @a::ComponentState<ContractState>) -> @ContractState {
            @unsafe_new_contract_state()
        }
        fn get_contract_mut(ref self: a::ComponentState<ContractState>) -> ContractState {
            unsafe_new_contract_state()
        }
        fn emit(ref self: a::ComponentState<ContractState>, event: a::Event) {
            let mut contract = a::HasComponent::get_contract_mut(ref self);
        // contract.emit(Event::A(event))
        }
    }
// user code.
// #[include(v0)]
// impl AImpl = a::AImpl<ContractState>;
// #[exteral(v0)]
// impl AERC20Impl = a::AERC20Impl<ContractState>;
}
