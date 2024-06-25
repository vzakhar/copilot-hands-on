def is_prime(num):
    return num > 1 and all(num % i for i in range(2, int(num ** 0.5) + 1))

# create a function to do 5 unit tests of the code above
def test_is_prime():
    assert is_prime(1) == False
    assert is_prime(2) == True
    assert is_prime(3) == True
    assert is_prime(4) == False
    assert is_prime(5) == True
    print('All tests pass') # if all tests pass, print 'All tests pass' to the console  and return None to indicate that the function has finished executing                                                        

#call the function to run the tests
test_is_prime()