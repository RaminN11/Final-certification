class Animal:
    def __init__(self, name, commands=[]):
        self.name = name
        self.commands = commands
    
    def learn_command(self, command):
        self.commands.append(command)
    
    def show_commands(self):
        return ', '.join(self.commands)

class Pet(Animal):
    pass

class WorkingAnimal(Animal):
    pass

class Dog(Pet):
    pass

class Cat(Pet):
    pass

class Hamster(Pet):
    pass

class Horse(WorkingAnimal):
    pass

class Donkey(WorkingAnimal):
    pass

class AnimalRegistry:
    def __init__(self):
        self.animals = []
    
    def add_animal(self, animal):
        self.animals.append(animal)
    
    def show_animals(self):
        for animal in self.animals:
            print(f'{animal.name}: {animal.show_commands()}')

registry = AnimalRegistry()

while True:
    print("1. Завести новое животное")
    print("2. Показать всех животных")
    print("3. Обучить животное новой команде")
    print("4. Выход")
    choice = input("Выберите действие: ")
    
    if choice == '1':
        name = input("Введите имя животного: ")
        type_animal = input("Введите тип (Собака, Кошка, Лошадь): ")
        if type_animal.lower() == 'собака':
            registry.add_animal(Dog(name))
        elif type_animal.lower() == 'кошка':
            registry.add_animal(Cat(name))
        elif type_animal.lower() == 'лошадь':
            registry.add_animal(Horse(name))
        print("Животное добавлено!")
    
    elif choice == '2':
        registry.show_animals()
    
    elif choice == '3':
        name = input("Введите имя животного: ")
        command = input("Введите новую команду: ")
        for animal in registry.animals:
            if animal.name == name:
                animal.learn_command(command)
                print("Команда добавлена!")
    
    elif choice == '4':
        break
