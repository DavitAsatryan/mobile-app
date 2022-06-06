const DioError400 = 'Http status error [400]';
const DioError401 = 'Http status error [401]';
const DioError403 = 'Http status error [403]';
const DioError404 = 'Http status error [404]';
const DioError409 = 'Http status error [409]';
const DioError413 = 'Http status error [413]';
const DioError422 = 'Http status error [422]';
const DioError500 = 'Http status error [500]';
const DioError501 = 'Http status error [501]';
const DioError502 = 'Http status error [502]';
const DioError503 = 'Http status error [503]';

bool is400StatusCodeFamily(String errorCode) {
  if (errorCode == DioError400 ||
      errorCode == DioError401 ||
      errorCode == DioError403 ||
      errorCode == DioError404 ||
      errorCode == DioError409 ||
      errorCode == DioError422) {
    return true;
  } else {
    return false;
  }
}

bool is500StatusCodeFamily(String errorCode) {
  if (errorCode == DioError500 ||
      errorCode == DioError501 ||
      errorCode == DioError502 ||
      errorCode == DioError503) {
    return true;
  } else {
    return false;
  }
}
