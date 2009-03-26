using System;

[Serializable]
public enum TipoComparable
{
    Indefinido = 0,
    Costos = 1,
    Mercado = 2,
    Ingresos = 3
}

[Serializable]
public enum RunningMode
{
    Server = 0,
    Client = 1
}
