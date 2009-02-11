using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SIGEA.Classes.Entities
{
    public partial class StatusAvaluo
    {
        public enum Status
        { 
            Alta = 1
            , Elaboracion = 2
            , SinRevisor = 3
            , Revisor = 4
            , Correccion = 5
            , Completado = 6
            , EnExportacion = 7
            , Finalizado = 8
        }

        public static short[] ListaNoAsignados
        {
            get
            {
                return new short[] { 1 };
            }
        }

        public static short[] ListaEnProceso
        {
            get
            {
                return new short[] { 2 };
            }
        }

        public static short[] ListaEnRevision
        {
            get
            {
                return new short[] { 3, 4 };
            }
        }

        public static short[] ListaEnCorreccion
        {
            get
            {
                return new short[] { 5 };
            }
        }

        public static short[] ListaCompletados
        {
            get
            {
                return new short[] { 6, 7, 8 };
            }
        }
    }
}
