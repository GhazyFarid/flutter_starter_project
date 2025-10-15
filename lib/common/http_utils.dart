bool isSuccessStatusCode(int? code) =>
    code != null && code >= 200 && code < 300;
