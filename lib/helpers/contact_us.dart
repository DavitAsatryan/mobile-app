final contactUs = Uri(
    scheme: 'mailto',
    path: 'Admin@localandloyal.co.uk',
    queryParameters: {'subject': 'Local & Loyal system request'});

String openEmail() {
  return contactUs.toString().replaceAll('+', '%20').replaceAll('%2520', '%20');
}
