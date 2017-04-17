"""
    Encode nucleotide sequence into a shorter base64 ascii string
    :Examples:
    A -> V2
    AC -> a1
    ACA -> Z0
    TAGC -> 0q2
    AAAGGACCTATTA -> VBrfV2

    The last character is always a number 0,1,2 indicating the number of padding characters
"""

import itertools

nucleotides = 'GACT'   # use GACU for RNA
alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
encode_dict = {''.join(s): c for s, c in zip(itertools.product(nucleotides, repeat=3), alphabet)}
decode_dict = {v: k for k, v in encode_dict.items()}


def encode(s):
    """
    :param s:  nucleotide sequence e.g. AAAGGACCTATTA
    :return:  encoded in base64 ASCII string e.g. VBrfV2
    """
    it = iter(s)
    return ''.join([encode_dict[''.join(tri)]
                    for tri in itertools.zip_longest(it, it, it, fillvalue=s[-1])]) + str(-len(s) % 3)


def decode(s):
    """
    :param s:  base64 string
    :return:  decoded nucleotide sequence
    """
    return ''.join(decode_dict[c] for c in s)[:-3-int(s[-1])]


def _test():
    """
    test the module
    """
    cases = ['A', 'AC', 'ACA', 'TAGC',   'AAAGGACCTATTA']
    for s in cases:
        s0 = encode(s)
        s1 = decode(s0)
        print('%s -> %s' % (s, s0))
        assert s == s1
        assert len(s0) <= 2+len(s)//3
