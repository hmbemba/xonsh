import fire
from db.models.auth.UserModel import User
import pprint

pp = pprint.PrettyPrinter(indent=4)


def allusers():
    pp.pprint( User.getAllAsDicts(User))

if __name__ == '__main__':
  fire.Fire()
