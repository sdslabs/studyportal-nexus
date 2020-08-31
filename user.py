import jwt

SECRET_KEY = 's-0n5h@4*e((tj3ll%8v=)9t$*24t*mdx6tyt&4+5k-l3x)pl='

encoded_jwt= jwt.encode(
    {
        'username': 'mhk19',
        'email': 'gmahak1@gmail.com',
    },
    SECRET_KEY,
    algorithm = 'HS256'
) 
print(encoded_jwt)