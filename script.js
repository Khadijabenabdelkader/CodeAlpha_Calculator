const display = document.getElementById('display');
var displayValue = '0';
var firstOperand = null;
var secondOperand = false;
var operator = null;

function clearDisplay() {
  displayValue = '0';
  firstOperand = null;
  secondOperand = false;
  operator = null;
  updateDisplay();
}

function deleteLast() {
  displayValue = displayValue.slice(0, -1);
  if (displayValue === '') {
    displayValue = '0';
  }
  updateDisplay();
}

function appendNumber(number) {
  if (secondOperand) {
    displayValue = String(number);
    secondOperand = false;
  } else {
    displayValue = displayValue === '0' ? String(number) : displayValue + number;
  }
  updateDisplay();
}

function appendOperator(nextOperator) {
  const value = parseFloat(displayValue);

  if (operator && secondOperand) {
    operator = nextOperator;
    return;
  }

  if (firstOperand === null) {
    firstOperand = value;
  } else if (operator) {
    const result = performance(firstOperand, value, operator);
    displayValue = String(result);
    firstOperand = result;
  }

  secondOperand = true;
  operator = nextOperator;
  updateDisplay();
}

function performance(first, second, operator) {
  if (operator === '+') {
    return first + second;
  } else if (operator === '-') {
    return first - second;
  } else if (operator === '*') {
    return first * second;
  } else if (operator === '/') {
    if(second=='0'){
        return 'Impossible';
    }else 
    return first / second;
  }
  return second;
}

function calculate() {
  const value = parseFloat(displayValue);
  if (operator && secondOperand) {
    operator = null;
    return;
  }
  if (firstOperand === null || operator === null) {
    return;
  }
  const result = performance(firstOperand, value, operator);
  displayValue = String(result);
  firstOperand = null;
  secondOperand = false;
  operator = null;
  updateDisplay();
}

function updateDisplay() {
  display.innerText = displayValue;
}

clearDisplay();
