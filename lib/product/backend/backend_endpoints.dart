// ignore_for_file: constant_identifier_names

class BackendURLS {
  static const String BASE_URL = 'https://findjopapi.onrender.com';

  static const String CREATE_ACCOUNT = 'https://findjopapi.onrender.com/createUser/';
  static const String SING_IN = 'https://findjopapi.onrender.com/loginUser/';
  static const String GET_ONE_USER_INFOR = 'https://findjopapi.onrender.com/getOneUserInformation/';

  static const String CREATE_USER_POST = '$BASE_URL/createUserPost/';
  static const String GET_USER_POST = '$BASE_URL/getUserPosts/';
  static const String GET_ALL_USERS_POST = '$BASE_URL/getAllUserPosts/';
  static const String GET_ALL_USERS = '$BASE_URL/getAllUsers/';
  static const String GET_USER_JOB_APPLICATION = '$BASE_URL/getUserJobApplications/';

  static const String CREATE_COMPANY = '$BASE_URL/createCompany/';
  static const String CREATE_COMPANY_POST = '$BASE_URL/createCompanyPost/';
  static const String GET_COMPANY_POST = '$BASE_URL/getCompanyPost/';
  static const String GET_ALL_COMPANIES_POST = '$BASE_URL/getAllCompaniesPost/';
  static const String GET_ALL_COMPANIES = '$BASE_URL/getAllCompanies/';
  static const String GET_COMPANY_JOB_APPLICATIONS = '$BASE_URL/getCompanyJobApplications/';

  static const String CREATE_JOB = '$BASE_URL/createJob/';
  static const String GET_ALL_JOBS = '$BASE_URL/getAllJobs/';
  static const String CREATE_JOB_APPLICATION = '$BASE_URL/createJobApplication/';
  static const String GET_COMPANY_JOBS = '$BASE_URL/getCompanyJobs/';
  static const String GET_ALL_JOB_APPLICATIONS = '$BASE_URL/getAllJobApplications/';

  static const String IMAGE_UPLOAD = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/";

  static const String CREATE_CAR = "https://placars-q4i4.onrender.com/AccountManagement/newCar/";
  static const String CAR_LISTS = "https://placars-q4i4.onrender.com/AccountManagement/ListmyCars/";
  static const String GET_ALL_CARS_LISTS = "https://placars-q4i4.onrender.com/AccountManagement/listAllCars/";
  static const String ADD_RECENTLY_MESSAGED = "https://qr-code-gen.onrender.com/api/v1/qr/saveQRCode";
  static const String GET_ACCOUNT_VIA_EMAIL = 'https://qr-code-gen.onrender.com/api/v1/qr/getAllQRCode';
}