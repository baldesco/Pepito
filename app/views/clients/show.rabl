object :@client

attributes :id, :name, :email

node(:url){
	@client.avatar.url
}

child(:sells){
	attributes :id, :total
}