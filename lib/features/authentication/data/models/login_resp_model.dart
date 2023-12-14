import 'dart:convert';

LoginRespModel loginRespModelFromJson(String str) =>
    LoginRespModel.fromJson(json.decode(str));

String loginRespModelToJson(LoginRespModel data) => json.encode(data.toJson());

class LoginRespModel {
  String jsonrpc;
  dynamic id;
  Result result;

  LoginRespModel({
    required this.jsonrpc,
    required this.id,
    required this.result,
  });

  factory LoginRespModel.fromJson(Map<String, dynamic> json) => LoginRespModel(
        jsonrpc: json["jsonrpc"],
        id: json["id"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "jsonrpc": jsonrpc,
        "id": id,
        "result": result.toJson(),
      };
}

class Result {
  int uid;
  String webUrl;
  String plantName;
  bool roReportsGroup;
  bool allowUnscheduledScanning;
  int partnerId;
  bool scanningAllowed;
  int companyId;
  List<int> allowedCompanies;
  int partnerRelatedPlantId;
  String companyName;
  String email;
  String username;
  bool authorityLogin;
  int hospitalActionId;
  String db;
  UserContext userContext;
  String name;
  String mobile;
  String plantResponseId;
  String sessionId;
  bool allowInactiveScanning;
  dynamic partnerResponseId;

  Result({
    required this.uid,
    required this.webUrl,
    required this.plantName,
    required this.roReportsGroup,
    required this.allowUnscheduledScanning,
    required this.partnerId,
    required this.scanningAllowed,
    required this.companyId,
    required this.allowedCompanies,
    required this.partnerRelatedPlantId,
    required this.companyName,
    required this.email,
    required this.username,
    required this.authorityLogin,
    required this.hospitalActionId,
    required this.db,
    required this.userContext,
    required this.name,
    required this.mobile,
    required this.plantResponseId,
    required this.sessionId,
    required this.allowInactiveScanning,
    required this.partnerResponseId,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        uid: json["uid"],
        webUrl: json["web_url"],
        plantName: json["plant_name"],
        roReportsGroup: json["ro_reports_group"],
        allowUnscheduledScanning: json["allow_unscheduled_scanning"],
        partnerId: json["partner_id"],
        scanningAllowed: json["scanning_allowed"],
        companyId: json["company_id"],
        allowedCompanies:
            List<int>.from(json["allowed_companies"].map((x) => x)),
        partnerRelatedPlantId: json["partner_related_plant_id"],
        companyName: json["company_name"],
        email: json["email"],
        username: json["username"],
        authorityLogin: json["authority_login"],
        hospitalActionId: json["hospital_action_id"],
        db: json["db"],
        userContext: UserContext.fromJson(json["user_context"]),
        name: json["name"],
        mobile: json["mobile"],
        plantResponseId: json["plant_response_id"],
        sessionId: json["session_id"],
        allowInactiveScanning: json["allow_inactive_scanning"],
        partnerResponseId: json["partner_response_id"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "web_url": webUrl,
        "plant_name": plantName,
        "ro_reports_group": roReportsGroup,
        "allow_unscheduled_scanning": allowUnscheduledScanning,
        "partner_id": partnerId,
        "scanning_allowed": scanningAllowed,
        "company_id": companyId,
        "allowed_companies": List<dynamic>.from(allowedCompanies.map((x) => x)),
        "partner_related_plant_id": partnerRelatedPlantId,
        "company_name": companyName,
        "email": email,
        "username": username,
        "authority_login": authorityLogin,
        "hospital_action_id": hospitalActionId,
        "db": db,
        "user_context": userContext.toJson(),
        "name": name,
        "mobile": mobile,
        "plant_response_id": plantResponseId,
        "session_id": sessionId,
        "allow_inactive_scanning": allowInactiveScanning,
        "partner_response_id": partnerResponseId,
      };
}

class UserContext {
  String lang;
  String tz;
  int uid;

  UserContext({
    required this.lang,
    required this.tz,
    required this.uid,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) => UserContext(
        lang: json["lang"],
        tz: json["tz"],
        uid: json["uid"],
      );

  Map<String, dynamic> toJson() => {
        "lang": lang,
        "tz": tz,
        "uid": uid,
      };
}
