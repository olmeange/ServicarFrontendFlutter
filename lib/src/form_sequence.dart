class FormSequence {
  bool formShow; // activate or deactivate current form
  int sequence; // index to change form
  bool showForwardButton; // activate or deactivate floating forward btn
  bool showBackButton; // activate or deactivate floating backward btn

  FormSequence(
      {this.formShow = true,
      this.sequence = 0,
      this.showForwardButton = true,
      this.showBackButton = false});
}
