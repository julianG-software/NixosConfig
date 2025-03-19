{
  config,
  #services,
  users,
  ...
}:
{

  config = {

    # Setup Allowed SSH Keys for User

    # User this if u need to set the keys fir the whole system
    # services.openssh.authorizedKeysFiles = [""]

    # note: ssh-copy-id will add user@your-machine after the public key
    # but we can remove the "@your-machine" part
    users.users.ulianj.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIEgFYF8ny+v6cRWu+LeCYSGq4HkDOLpwvHUx7bALxzTH ulianj" # Gamboot "Work" Pc
    ];

  };

}
