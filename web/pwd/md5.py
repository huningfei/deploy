import hashlib


def md5(data):
    """
    MD5加密
    :param data: 要加密的字符串
    :return: 加密后的字符串
    """
    hash = hashlib.md5(b'us9sdkfsdfj')
    hash.update(data.encode('utf-8'))
    return hash.hexdigest()
