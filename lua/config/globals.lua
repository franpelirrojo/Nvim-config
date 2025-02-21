-- Escribe el contenido de la tabla
P = function (v)
    print(vim.inspect(v))
    return v
end

-- Elimina el módulo de la tabla de modulosde modulos del entorno de lua
R = function (v)
    package.loaded[v] = nil
end
