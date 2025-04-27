let counter = 0;

const counterElement = document.getElementById('counter');
const clickButton = document.getElementById('clickButton');

clickButton.addEventListener('click', () => {
    counter++;
    counterElement.textContent = `Очки: ${counter}`;
});
