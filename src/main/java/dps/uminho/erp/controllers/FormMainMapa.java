package dps.uminho.erp.controllers;

import java.util.HashSet;
import java.util.Set;

import dps.uminho.erp.components.PontoElectrao;

public class FormMainMapa {

	private Set<String> distritosSet = null;
	private Set<String> concelhosSet = null;
	
	private Set<PontoElectrao> pontoElectraoSet = null;
	
	public FormMainMapa() {
		this.distritosSet = new HashSet<String>();
		this.concelhosSet = new HashSet<String>();
		this.pontoElectraoSet = new HashSet<PontoElectrao>();
	}

	public Set<String> getDistritosSet() {
		return distritosSet;
	}

	public void setDistritosSet(Set<String> distritosSet) {
		this.distritosSet = distritosSet;
	}

	public Set<String> getConcelhosSet() {
		return concelhosSet;
	}

	public void setConcelhosSet(Set<String> concelhosSet) {
		this.concelhosSet = concelhosSet;
	}

	public Set<PontoElectrao> getPontoElectraoSet() {
		return pontoElectraoSet;
	}

	public void setPontoElectraoSet(Set<PontoElectrao> pontoElectraoSet) {
		this.pontoElectraoSet = pontoElectraoSet;
	}
	
	public void clear() {
		this.concelhosSet.clear();
		this.distritosSet.clear();
		this.pontoElectraoSet.clear();
	}
}
