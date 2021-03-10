function toggleContainer() {
	const $categoryContainer = document.getElementsByClassName('category_container')[0]
	if ($categoryContainer.classList.contains('container_visible')) {
		$categoryContainer.classList.remove('container_visible')
		return;
	}
	$categoryContainer.classList.add('container_visible')
}

window.addEventListener('DOMContentLoaded', () => {
	console.log('DOM LOADED!!')
	const $categoryButton = document.getElementById('C_text')
	const $categoryContainer = document.getElementsByClassName('category_container')[0]
	// $ 는 노드를 표시하는 컨벤션
	$categoryButton.addEventListener('click', (e) => {
		toggleContainer()
	})	
	
	const $ul = $categoryContainer.querySelector('ul')
	
	$ul.addEventListener('click', (e) => {
		const $li = e.target
		const text = $li.textContent
		$categoryButton.innerText = text
		const $categoryInput = document.getElementsByClassName('category_input')[0]
		$categoryInput.value = text
		toggleContainer()
	})
})
