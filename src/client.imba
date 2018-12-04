import {Todo} from './todo'

var store = {
	title: ""
	items: []
}

tag App
	def addItem
		data:items.push Todo.new(data:title, done: no)
		data:title = ""

	def toggleTodo item
		console.log item
		item.done = !item.done

	def deleteTodo item
		let filtered = []
		for todo in data:items 
			if todo !== item
				filtered.push todo
			else continue
		data:items = filtered
		
	def render
		<self.vbox>
			<header>
				<input[data:title] placeholder="New..." :keyup.enter.addItem>
				<button :tap.addItem> 'Add item'
			<ul> for item, index in data:items
				<li .item :tap.toggleTodo(item)> 
					<p .done=(item.done)> item.title
					<button .warning :tap.deleteTodo(item)> 'Delete'


Imba.mount <App[store]>