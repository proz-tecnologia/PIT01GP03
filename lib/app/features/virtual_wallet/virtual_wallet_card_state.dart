abstract class VirtualWalletCardState {}

class VirtualWalletCardInitialState extends VirtualWalletCardState {}

class VirtualWalletCardLoadingState extends VirtualWalletCardState {}

class VirtualWalletCardSuccessState extends VirtualWalletCardState {}

class VirtualWalletCardErrorState extends VirtualWalletCardState {
  final String message;
  VirtualWalletCardErrorState(this.message);
}
