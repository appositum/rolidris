{ build-idris-package
, contrib
, lightyear
, lib
}:
build-idris-package  {
  name = "rolidris";
  version = "0.1.0.0";

  # This is the .ipkg file that should be built, defaults to the package name
  # In this case it should build `Yaml.ipkg` instead of `yaml.ipkg`
  # This is only necessary because the yaml packages ipkg file is
  # different from its package name here.
  ipkgName = "rolidris";
  # Idris dependencies to provide for the build
  idrisDeps = [ contrib lightyear ];
  src = ./.;
  meta = {
    description = "ROLA but in Idris";
    homepage = "https://github.com/appositum/rolidris";
    license = lib.licenses.asl20;
  };
}
