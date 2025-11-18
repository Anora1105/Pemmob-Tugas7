import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';


class StorageService {
static late SharedPreferences _prefs;
static const _keyAccounts = 'h1d_accounts';
static const _keyUsername = 'h1d_username';


static String? get currentUsername => _prefs.getString(_keyUsername);


static Future<void> init() async {
_prefs = await SharedPreferences.getInstance();
}


// Accounts stored as JSON map: { username: password }
static Map<String, String> _loadAccounts() {
final raw = _prefs.getString(_keyAccounts);
if (raw == null) return {};
try {
final Map<String, dynamic> m = jsonDecode(raw);
return m.map((k, v) => MapEntry(k, v.toString()));
} catch (_) {
return {};
}
}


static Future<bool> saveAccount(String username, String password) async {
final accounts = _loadAccounts();
if (accounts.containsKey(username)) return false; // already exists
accounts[username] = password;
await _prefs.setString(_keyAccounts, jsonEncode(accounts));
return true;
}


static Future<bool> validateLogin(String username, String password) async {
final accounts = _loadAccounts();
if (!accounts.containsKey(username)) return false;
return accounts[username] == password;
}


static Future<void> setCurrentUser(String username) async {
await _prefs.setString(_keyUsername, username);
}


static Future<void> clearCurrentUser() async {
await _prefs.remove(_keyUsername);
}
}