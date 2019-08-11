function pass_hash(pass){
  const shaObj = new jsSHA("SHA-256", "TEXT");
  shaObj.update(pass + "this_is_"+ pass.slice(0,2) + pass.slice(-2));
  return passhash = shaObj.getHash("HEX");
}
