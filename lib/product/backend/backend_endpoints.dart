// ignore_for_file: constant_identifier_names

class BackendURLS {
  static const String BASE_URL = 'https://findjopapi.onrender.com';

  static const String CREATE_ACCOUNT = '$BASE_URL/createUser/';
  static const String SING_IN = '$BASE_URL/loginUser/';
  static const String GET_ONE_USER_INFOR = '$BASE_URL/getOneUserInformation/';

  static const String CREATE_USER_POST = '$BASE_URL/createUserPost/';
  static const String GET_USER_POST = '$BASE_URL/getUserPosts/';
  static const String GET_ALL_USERS_POST = '$BASE_URL/getAllUserPosts/';
  static const String GET_ALL_USERS = '$BASE_URL/getAllUsers/';
  static const String GET_USER_JOB_APPLICATION = '$BASE_URL/getUserJobApplications/';
  static const String UPDATE_PROFILE = '$BASE_URL/updateAccountInfo/';

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
  static const String DELETE_JOB_APPLICATION = '$BASE_URL/deleteJobApplication/';
  static const String GET_ORDERED_JOBS = '$BASE_URL/getOrderedJobs/';

  static const String IMAGE_UPLOAD = "https://firebasestorage.googleapis.com/v0/b/findjob-5468d.appspot.com/o/";

  static const String CREATE_CAR = "https://placars-q4i4.onrender.com/AccountManagement/newCar/";
  static const String CAR_LISTS = "https://placars-q4i4.onrender.com/AccountManagement/ListmyCars/";
  static const String GET_ALL_CARS_LISTS = "https://placars-q4i4.onrender.com/AccountManagement/listAllCars/";
  static const String ADD_RECENTLY_MESSAGED = "https://qr-code-gen.onrender.com/api/v1/qr/saveQRCode";
  static const String GET_ACCOUNT_VIA_EMAIL = 'https://qr-code-gen.onrender.com/api/v1/qr/getAllQRCode';
}
