#include <GL/glew.h>
#include <GLFW/glfw3.h>
#include <cstdlib>
#include <fstream>
#include <iostream>
#include <string>
#include "./lib/Exceptions/except.h"
#include "./lib/err_handler/err_handler.h"


const char* sourceFile(const char *str) {
    std::fstream f(str);
    if (!f.is_open()) return "";
    f.seekg(0, f.end);
    int file_length = f.tellg();
    f.seekg(0,f.beg);
    char *contents = new char[file_length + 1];
    f.read((char*)contents, file_length);
    contents[file_length] = '\0';
    return contents;
}

int CompileShader(GLuint type, const char *source)
{
    GLuint id = glCreateShader(type);
    glShaderSource(id, 1, &source, nullptr);
    glCompileShader(id);

    GLint res = -1;
    glGetShaderiv(id, GL_COMPILE_STATUS, &res);
    if (res == GL_FALSE)
    {
        std::cerr << "____FAILED TO COMPILE SHADER_____:\n";
        int len;
        glGetShaderiv(id, GL_INFO_LOG_LENGTH, &len);
        GLchar *msg = new char[len];
        glGetShaderInfoLog(id, len, &len, msg);
        std::cerr << msg << '\n';
        glDeleteShader(id);
        delete[] msg;
        return EXIT_FAILURE;
    }

    return id;
}

void CompileProgram(GLuint progID, const char *vertSource, const char *fragSource)
{
    GLuint vertID = CompileShader(GL_VERTEX_SHADER, vertSource); 
    GLuint fragID = CompileShader(GL_FRAGMENT_SHADER, fragSource);
    glAttachShader(progID, vertID);
    glAttachShader(progID, fragID);
    glLinkProgram(progID);
    glValidateProgram(progID);
}

int main()
{
    glfwSetErrorCallback(glfwError);
    if (glfwInit() != GLFW_TRUE) OpenGLError("Could not initialize GLFW library");
    GLFWwindow *win = glfwCreateWindow(600, 600, "Hello, OpenGL", NULL, NULL);
    glfwMakeContextCurrent(win);
    
    if (!win) OpenGLError("Could not create window");

    if (glewInit() != GLEW_OK) OpenGLError("Could not initialize GLEW library");
    glDebugMessageCallback(dmesg, NULL);

    // Next steps is to create buffers
    // VBO, VIO, VAO
    // Shaders included

    GLuint vbo = -1;
    glGenBuffers(1, &vbo);
    GLfloat points[] = {
        -0.5f, 0.5f, // left-up 0
         0.5f, 0.5f, // right-up 1
         0.5f,-0.5f, // right-down 2
        -0.5f,-0.5f // left-down 3
    };
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBufferData(GL_ARRAY_BUFFER, sizeof(points), points, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    
    GLuint vio = -1;
    glGenBuffers(1, &vio);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, vio);
    GLuint indexArray[] = {
        // first triangle
        3,0,1,
        // second
        1,2,3
    };
    glBufferData(GL_ELEMENT_ARRAY_BUFFER, sizeof(indexArray), indexArray, GL_STATIC_DRAW);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);

    GLuint vao = -1;
    glGenVertexArrays(1, &vao);
    glBindVertexArray(vao);
    glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(GL_FLOAT) *2, (void*)0);
    glEnableVertexAttribArray(0);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, vio);
    glBindBuffer(GL_ARRAY_BUFFER, 0);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
    

    GLuint shader = glCreateProgram();
    const char *vertShader = sourceFile("./res/shaders/basic.vert.glsl");
    const char *fragShader = sourceFile("./res/shaders/basic.frag.glsl");
    CompileProgram(shader, vertShader, fragShader);
    delete[] vertShader;
    delete[] fragShader;
    glUseProgram(shader);
    glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, vio);
    glBindBuffer(GL_ARRAY_BUFFER, vbo);
    


    while (!glfwWindowShouldClose(win))
    {
        glClear(GL_COLOR_BUFFER_BIT);
        glDrawElements(GL_TRIANGLES, 6, GL_UNSIGNED_INT, nullptr);
        glfwSwapBuffers(win);
        glfwPollEvents();
    }

    return EXIT_SUCCESS;
}
