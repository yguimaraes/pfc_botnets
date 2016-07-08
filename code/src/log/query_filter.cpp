#include "query_filter.h"
#include "query_executer.h"

void QueryFilter::ProcessLogs(){
    string files[] = {
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120224-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120225-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120226-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120227-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120228-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120229-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120312-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120313-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120314-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120315-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120316-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120317-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120318-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120319-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120322-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120323-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120324-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120325-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120326-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120327-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120328-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120329-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120403-log-dns-ime.txt",
        "../private/log_completo/log_fev_mar_abr_2012/log_completo_separado_por_dia/20120404-log-dns-ime.txt"
    };
    for(int i=0; i<24; i++){   
        printf("Processing file %d \n", i);   
        QueryExecuter query_executer(files[i], m_storage);
        query_executer.ProcessDnsLog();
    }
}

QueryFilter::~QueryFilter(){
    delete m_storage;
}

QueryFilter::QueryFilter(){};