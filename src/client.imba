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
				<input[data:title] css:flex='1 1 auto' placeholder="New..." :keyup.enter.addItem>
				<button :tap.addItem> 'Add item'
			<ul> for item, index in data:items
				<li .item> 
					<input css:margin-right='10px' type='checkbox' :tap.toggleTodo(item)>
					<p .done=(item.done)> item.title
					<div .whitespace>
					<button .warning-text :tap.deleteTodo(item)> 'Delete'


Imba.mount <App[store]>