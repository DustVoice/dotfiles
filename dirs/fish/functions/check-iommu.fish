function check-iommu --description 'Check iommu groups'
    for g in /sys/kernel/iommu_groups/*
        echo "IOMMU Group ${g##*/}:"

        for d in $g/devices/*
            echo -e "\t$(lspci -nns ${d##*/})"
        end
    end
end
