# PokeApi-Project-Python-AWS-DynamoDB-Terraform

<h2>Description</h2>

<p>
This project is a terminal-based application developed in Python using Boto3 for AWS interaction,</br> with infrastructure provisioned through Terraform and DynamoDB as the database. The application</br> allows users to interactively retrieve information about various Pokémon in an engaging and efficient manner.
</br>
Upon running the script, users are prompted to "draw" a Pokémon. The application then checks if</br> the selected Pokémon already exists in the DynamoDB database. If the Pokémon is found, a message</br> is displayed indicating that the Pokémon is already in the database. If the Pokémon is not present,</br> the app fetches its relevant details-such as ID, name, weight, height, and types-from an external</br> API and saves these details to the database.

</p>

 <h2> Stack</h2>
:white_medium_small_square: Python - Boto3
:white_medium_small_square: AWS
:white_medium_small_square: DynamoDB
:white_medium_small_square: Terraform
</br>

<h2>Challenges</h2>
<p>
The primary challenge in this project was setting up the infrastructure using Terraform. Terraform, as</br> an Infrastructure-as-Code (IaC) tool, simplifies the process of provisioning and managing cloud</br> resources. It allows for automation, ensuring consistency and reducing manual efforts in configuring infrastructure.
</p>

<h2> What Have I Learned? </h2>
:white_medium_small_square: Python Boto3: Deepened my knowledge of using Python's Boto3 library to interact with AWS services programmatically.
</br>
:white_medium_small_square: Terraform: Gained proficiency in Terraform for defining, deploying, and managing cloud infrastructure through code.
