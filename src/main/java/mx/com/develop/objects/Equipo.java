/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mx.com.develop.objects;

import java.util.Comparator;

/**
 *
 * @author Cesar
 */
public class Equipo {

    private int idEquipo;
    private String nombre;
    private String logotipo;
    private String colorPrimario;
    private String colorSecundario;
    private int puntos;
    private int puntosAFavor;
    private int puntosEnContra;
    private int perdidosPorDefault;
    private int idCategoria;

    public int getIdEquipo() {
        return idEquipo;
    }

    public void setIdEquipo(int idEquipo) {
        this.idEquipo = idEquipo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getLogotipo() {
        return logotipo;
    }

    public void setLogotipo(String logotipo) {
        this.logotipo = logotipo;
    }

    public String getColorPrimario() {
        return colorPrimario;
    }

    public void setColorPrimario(String colorPrimario) {
        this.colorPrimario = colorPrimario;
    }

    public String getColorSecundario() {
        return colorSecundario;
    }

    public void setColorSecundario(String colorSecundario) {
        this.colorSecundario = colorSecundario;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }

    public int getPuntosAFavor() {
        return puntosAFavor;
    }

    public void setPuntosAFavor(int puntosAFavor) {
        this.puntosAFavor = puntosAFavor;
    }

    public int getPuntosEnContra() {
        return puntosEnContra;
    }

    public void setPuntosEnContra(int puntosEnContra) {
        this.puntosEnContra = puntosEnContra;
    }

    public int getPerdidosPorDefault() {
        return perdidosPorDefault;
    }

    public void setPerdidosPorDefault(int perdidosPorDefault) {
        this.perdidosPorDefault = perdidosPorDefault;
    }

    @Override
    public String toString() {
        return puntos + " " + idEquipo;
    }

    public static Comparator<Equipo> getComparatorPorPuntos() {
        Comparator comp = new Comparator<Equipo>() {
            @Override
            public int compare(Equipo e1, Equipo e2) {
                return e2.getClasficacion() - e1.getClasficacion();
            }
        };
        return comp;
    }
    
    public int getClasficacion(){
        return (this.getPuntos()*10000)+((this.getPuntosAFavor()-this.getPuntosEnContra())*100)+this.getPuntosAFavor();
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

}
