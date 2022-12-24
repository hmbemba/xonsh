

def _newcpp():
    item.mkdir('src','.')
    item.mkdir('bin','.')
    FileContent = '''
#include <iostream> 
int main()
{
 std::cout << "Hello World.";
}
'''
    item.mkfileNoOverwrite('main.cpp', './src', FileContent)
    commandsContent = f'''
aliases['main'] = "g++ src/main.cpp -o bin/main_cpp; bin/main_cpp" 
aliases['home'] = r'cd {$pwd()}' 
aliases['src'] = r'cd {$pwd()}/src' 
aliases['binn'] = r'cd {$pwd()}/bin' 
'''
    item.mkfileNoOverwrite('commands.xsh', '.', commandsContent)
    importcommands


aliases['newcpp'] = _newcpp