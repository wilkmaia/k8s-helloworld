import time
from flask import Flask
from flask import Response

app = Flask(__name__)

def is_prime(number):
    if number < 0:
        number = -number

    divisors = []

    t = 2
    while t < number:
        if number % t == 0:
            divisors.append(t)
        
        t = t + 1

    if len(divisors) > 0:
        return False

    return True

def calculate_nth_prime(n):
    if n <= 0 or n > 10000:
        return None

    number = 1
    primes = 0

    x = n
    while x > 0:
        if is_prime(number):
            primes = primes + 1
            if primes == n:
                return number

            x = x - 1

        number = number + 1

@app.route('/<int:n>')
def get_nth_prime(n):
    start_time = time.time_ns()
    result = calculate_nth_prime(n)
    elapsed_time = time.time_ns() - start_time

    response = Response(str(result))
    response.headers['X-Elapsed-Time-Nanosecs'] = str(elapsed_time)
    response.headers['Server'] = None

    return response


if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
